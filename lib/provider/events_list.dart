import 'package:care_square_assignment/data/events.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsNotifier extends StateNotifier<List<CalendarEvent>> {
  EventsNotifier() : super(events);

  void addEvent(String title, DateTime day, Color color) {
    // state = [...state, CalendarEvent(title: title, date: day, color: color)];
  }

  void removeEvent(DateTime day) {}

  List<CalendarEvent> getEventsforDay(DateTime day) {
    List<CalendarEvent> temp = [];

    // searach for matching events
    for (var element in state) {
      if (element.startTime.month == day.month &&
          element.startTime.day == day.day) {
        temp.add(element);
      }
    }

    return temp;
  }
}

final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<CalendarEvent>>(
        (ref) => EventsNotifier());
