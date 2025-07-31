import 'package:flutter/material.dart';
import 'package:app/repositories/manicure_record/manicure_record.dart';

abstract class AbstractManicureRecordRepository {
  Future<Map<DateTime, List<TimeOfDay>>> loadManicureEvents();
  Future<List<ManicureRecord>> loadManicureRecords();
}