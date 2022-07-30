import 'package:care_square_assignment/data/events.dart';
import 'package:flutter/material.dart';

class CalendarEvent {
  final String title;
  final DateTime date;
  final Color color;
  final String? description;

  CalendarEvent(
      {required this.title,
      required this.date,
      required this.color,
      this.description});
}

List<CalendarEvent> getEventsforDay(DateTime day) {
  // List<CalendarEvent> output =
  //     events.where((event) => event.date.toUtc() == day.toUtc()).toList();

  return events.where((element) => element.date == day).toList();
}
