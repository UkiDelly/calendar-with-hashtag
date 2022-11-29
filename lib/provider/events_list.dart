import 'package:care_square_assignment/data/events.dart';
import 'package:care_square_assignment/model/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsNotifier extends StateNotifier<List<CalendarEventModel>> {
  EventsNotifier() : super(events);

  // Add event
  set addEvent(CalendarEventModel event) => state.add(event);

  // remove event
  void removeEvent(CalendarEventModel event) {
    state.remove(event);
  }

  // get event for day
  List<CalendarEventModel> getEventsforDay(DateTime day) {
    List<CalendarEventModel> temp = [];

    // search for matching events
    for (CalendarEventModel event in state) {
      if (event.startTime.month == day.month && event.startTime.day == day.day) {
        temp.add(event);
      }
    }

    return temp;
  }

  // update Event
  void updateEvent(CalendarEventModel oldEvent, CalendarEventModel newEvent) {
    // remove the old event and add updated event
    state
      ..remove(oldEvent)
      ..add(newEvent);
  }
}

// provider for listen the state notifier
final eventListProvider =
    StateNotifierProvider<EventsNotifier, List<CalendarEventModel>>((ref) => EventsNotifier());
