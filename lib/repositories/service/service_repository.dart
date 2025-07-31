import 'service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRepository implements AbstractServiceRepository{

  ServiceRepository({required Box metaBox, required Box<Service> servicesBox}) : _metaBox = metaBox, _servicesBox = servicesBox;

  final Box _metaBox;
  final Box<Service> _servicesBox;


  @override
  Box<Service> get getServicesBox => _servicesBox;

  @override
  Future<void> syncServices() async {

    final talker = GetIt.I<Talker>();

    try {
      
      final [firebaseVersion, cachedVersion] = await Future.wait([
          getFirebaseVersion(),
          getVersion(),
        ]);

      if (firebaseVersion != cachedVersion){

        final snapshot = await FirebaseFirestore.instance
          .collection('services')
          .get();

        final List<Service> services = snapshot.docs
          .map((doc) {
            final data = doc.data() as Map<String, dynamic>?;
            if (data == null) {
              throw Exception('Document data is null');
            }
            return Service.fromJson(data);
          })
          .toList();

        await _servicesBox.clear();
        await _servicesBox.addAll(services);
        await saveCurrentServicesVersion(firebaseVersion);

        talker.info('The service version has been updated');
      }
    } catch (e, st) {
      talker.handle(e, st);
    }
  }

  @override
  Future<int> getVersion() async {
    return await _metaBox.get('services_version') as int? ?? 0;
  }

  @override
  Future<int> getFirebaseVersion() async {
    final doc = await FirebaseFirestore.instance
        .collection('metadata')
        .doc('services')
        .get();
    return doc.data()?['version'] as int? ?? 0;
  }

  @override
  Future<void> saveCurrentServicesVersion(int version) async {
    await _metaBox.put('services_version', version);
  }
}
