import 'package:flutter/material.dart';

class CalendarEvent {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String description;

  CalendarEvent({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.description,
  });

  @override
  String toString() {
    return "CalendarEvent(title: $title, startTime: $startTime, endTime: $endTime, color: $color, description: $description)";
  }
}
