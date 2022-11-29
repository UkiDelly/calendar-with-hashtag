import 'package:care_square_assignment/data/events.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsNotifier extends StateNotifier<List<CalendarEvent>> {
  EventsNotifier() : super(events);

  // Add event
  set addEvent(CalendarEvent event) => state.add(event);

  // remove event
  void removeEvent(CalendarEvent event) {
    state.remove(event);
  }

  // get event for day
  getEventsforDay(DateTime day) {
    List<CalendarEvent> temp = [];

    // search for matching events
    for (var element in state) {
      if (element.startTime.month == day.month && element.startTime.day == day.day) {
        temp.add(element);
      }
    }

    return temp;
  }

  // update Event
  void updateEvent(CalendarEvent oldEvent, CalendarEvent newEvent) {
    // remove the old event and add updated event
    state
      ..remove(oldEvent)
      ..add(newEvent);
  }
}

// provider for listen the state notifier
final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<CalendarEvent>>((ref) => EventsNotifier());
