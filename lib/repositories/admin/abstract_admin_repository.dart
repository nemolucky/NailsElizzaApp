import 'package:app/repositories/manicure_record/manicure_record.dart';

abstract class AbstractAdminRepository {
  Future<void> addRecord(ManicureRecord record);
}