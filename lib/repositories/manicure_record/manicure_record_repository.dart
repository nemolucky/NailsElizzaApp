import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/repositories/manicure_record/manicure_record.dart';

class ManicureRecordRepository implements AbstractManicureRecordRepository{

  @override
  Future<List<ManicureRecord>> loadManicureRecords() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('records')
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ManicureRecord.fromFirestore(doc))
        .toList();
  }

  @override
  Future<Map<DateTime, List<TimeOfDay>>> loadManicureEvents() async {
    try {
      final records = await loadManicureRecords();

      final Map<DateTime, List<TimeOfDay>> groupedRecords = {};
      
      for (final record in records) {
        final dateOnly = DateTime(
          record.date.year,
          record.date.month,
          record.date.day,
        );
        
        if (groupedRecords.containsKey(dateOnly)) {
          groupedRecords[dateOnly]!.add(record.time);
        } else {
          groupedRecords[dateOnly] = [record.time];
        }
      }

      return groupedRecords;
      // return groupedRecords.entries
      //     .map((entry) => ManicureEvent(
      //           date: entry.key,
      //           times: entry.value,
      //         ))
      //     .toList();
    } catch (e) {
      print('Error loading manicure events: $e');
      throw e;
    }
  }

}