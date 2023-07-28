import 'package:flutter/material.dart';

class CalendarEvent {
  final String name;
  final TimeOfDay startTime;
  final Duration duration;

  const CalendarEvent({
    required this.name,
    required this.startTime,
    required this.duration,
  });
}
