import 'package:care_square_assignment/data/events.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsNotifier extends StateNotifier<List<CalendarEvent>> {
  EventsNotifier() : super(events);

  addEvent(DateTime day) {}

  removeEvent(DateTime day) {}

  getEventsforDay(DateTime day) {
    return [];
  }
}
