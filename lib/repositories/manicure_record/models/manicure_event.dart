import 'package:flutter/material.dart';

class ManicureEvent {
  final DateTime date;
  final List<TimeOfDay> times;

  ManicureEvent({
    required this.date,
    required this.times,
  });
}