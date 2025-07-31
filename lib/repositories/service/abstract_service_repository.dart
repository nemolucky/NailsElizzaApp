import 'service.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AbstractServiceRepository {
  Box<Service> get getServicesBox;
  Future<void> syncServices();
  Future<int> getVersion();
  Future<int> getFirebaseVersion();
  Future<void> saveCurrentServicesVersion(int version);
}