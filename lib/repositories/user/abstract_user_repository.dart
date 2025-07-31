abstract class AbstractUserRepository {
  Future<bool> signUp(String name, String tgUsername, String password);
  Future<bool> signIn(String tgUsername, String password);
  Future<void> addUser(String name, String hashTgUsername, String tgUsername, String hashPassword);
  Future<bool> isPasswordEqual(String hashTgUsername, String hashPassword);
  Future <bool> checkIsNewUser(String hashTgUsername);
  String hash(String field);
  Future<String> generateAuthToken();
  Future<void> addAuthToken(String hashTgUsername,String token);
  Future<bool> checkAuthToken();
  Future<bool> checkTokenForRelevance(String token);
}