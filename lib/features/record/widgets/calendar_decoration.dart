import 'package:flutter/material.dart';

class CalendarDecoration extends StatelessWidget {
  const CalendarDecoration({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(225, 225, 225, 1),
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 45),
        padding: const EdgeInsets.all(8),
        child: child,
      );
  }
}