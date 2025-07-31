import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ManicureRecord {
  ManicureRecord({
    required this.date,
    required this.time
  });

  final DateTime date;
  final TimeOfDay time;

  Map<String, dynamic> toFirestore() {
    return {
      'date': Timestamp.fromDate(date),
      'time': {
        'hour': time.hour,
        'minute': time.minute,
      },
    };
  }

  factory ManicureRecord.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final timeData = data['time'] as Map<String, dynamic>;
    
    return ManicureRecord(
      date: (data['date'] as Timestamp).toDate(),
      time: TimeOfDay(
        hour: timeData['hour'] as int,
        minute: timeData['minute'] as int,
      ),
    );
  }
}