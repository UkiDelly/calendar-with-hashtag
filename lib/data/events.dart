import 'package:care_square_assignment/data/accounts.dart';
import 'package:care_square_assignment/model/calendar_event.dart';

List<CalendarEvent> events = [
  CalendarEvent(
      title: "귀국",
      startTime: DateTime(2022, 8, 2, 0, 0),
      endTime: DateTime(2022, 8, 2, 23, 59),
      allDay: true,
      memo: "드디어 귀국하는 날",
      alarm: {},
      account: accounts[0]),
  CalendarEvent(
    title: "광복절",
    startTime: DateTime(2022, 8, 15, 0, 0),
    endTime: DateTime(2022, 8, 15, 0, 0),
    account: accounts[1],
    alarm: {},
    allDay: true,
  )
];
