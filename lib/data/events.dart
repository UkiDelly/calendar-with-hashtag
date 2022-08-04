import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';

List<CalendarEvent> events = [
  CalendarEvent(
      title: "진료",
      startTime: DateTime(2022, 8, 2, 0, 0),
      endTime: DateTime(2022, 8, 2, 23, 59),
      description: "오늘은 진료가 있는날",
      color: Colors.red),
];
