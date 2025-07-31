import 'user.dart';
import 'dart:math';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserRepository implements AbstractUserRepository{

  UserRepository({required Box tokenBox}) : _tokenBox = tokenBox;

  final Box _tokenBox;

  Box get getTokenBox => _tokenBox;

  @override
  Future<bool> signUp(String name, String tgUsername, String password) async {

    final String hashUsername = hash(tgUsername);

    final bool isNewUser = await checkIsNewUser(hashUsername);

    if (isNewUser){

      final String hashPassword = hash(password);

      await addUser(name, hashUsername, tgUsername, hashPassword);

      return true;
    }

    return false;
  }

  @override
  Future<bool> signIn(String tgUsername, String password) async {

    final String hashUsername = hash(tgUsername);

    final bool isNewUser = await checkIsNewUser(hashUsername);

    if (!isNewUser){

      final String hashPassword = hash(password);

      final success = await isPasswordEqual(hashUsername, hashPassword);

      try {
        final token = await generateAuthToken();

        await addAuthToken(hashUsername, token);

        await _tokenBox.clear();
                
        await _tokenBox.put('token', token);

      } catch (e) {
        print(e);
      }

      return success;

    }
    
    return false;
  }

  @override
  Future<bool> checkAuthToken() async {

    if (_tokenBox.isNotEmpty){

      final tokenInBox = _tokenBox.get('token');

      final success = await checkTokenForRelevance(tokenInBox);

      return success;
    }
    return false;
  }

  @override
  Future<void> addUser(String name, String hashTgUsername, String tgUsername, String hashPassword) async {
    final users = FirebaseFirestore.instance.collection('users');
    await users.doc(hashTgUsername).set({
      'name' : name,
      'tgUsername' : tgUsername,
      'password' : hashPassword,
    });
  }

  @override
  Future<bool> isPasswordEqual(String hashTgUsername, String hashPassword) async {
    final users = FirebaseFirestore.instance.collection('users');
    final userDoc = await users.doc(hashTgUsername).get();
    final userData = userDoc.data() as Map<String, dynamic>;

    return userData['password'] == hashPassword;
  }

  @override
  Future <bool> checkIsNewUser(String hashTgUsername) async {
    final snapshot = await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(hashTgUsername)
                                      .get();
    return !snapshot.exists;
  }

  @override
  String hash(String field){
    final bytes = utf8.encode(field);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  @override
  Future<String> generateAuthToken() async {
  final random = Random.secure();
  final uuid = Uuid().v4();
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final tokens = FirebaseFirestore.instance.collection('tokens');
  late String token;
  late bool exists;

  do {
    token = sha256.convert(utf8.encode('$uuid$timestamp${random.nextInt(1 << 31)}')).toString(); 
    var tokenDoc = await tokens.doc(token).get();
    exists = tokenDoc.exists; 

  } while (exists);

  return token;

  }
  

  @override
  Future<void> addAuthToken(String hashTgUsername,String token) async {
    final tokens = FirebaseFirestore.instance.collection('tokens');
    tokens.doc(token).set({
      'userId' : hashTgUsername,
      'token' : token,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<bool> checkTokenForRelevance(String token) async {
    final tokens = FirebaseFirestore.instance.collection('tokens');
    final tokenDoc = await tokens.doc(token).get();
    if (!tokenDoc.exists) {
      await _tokenBox.clear();
      return false;
    }

    final tokenData = tokenDoc.data() as Map<String, dynamic>;
    final createdAt = tokenData['createdAt'] as Timestamp; 
    final now = DateTime.now();
    final tokenDate = createdAt.toDate();
    final threeMonthsAgo = DateTime(now.year, now.month - 3, now.day);

    if (tokenDate.isBefore(threeMonthsAgo)) {
      await tokens.doc(token).delete(); 
      return false;
    }
    return true;
  }
}
