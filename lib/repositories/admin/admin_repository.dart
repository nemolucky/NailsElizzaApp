import 'admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/repositories/manicure_record/manicure_record.dart';

class AdminRepository implements AbstractAdminRepository{

  @override
  Future<void> addRecord(ManicureRecord record) async {
    final records = FirebaseFirestore.instance.collection('records');
    await records.add(record.toFirestore());
  }
}