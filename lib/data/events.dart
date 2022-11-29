import 'package:care_square_assignment/data/accounts.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/model/repeat_enum.dart';

List<CalendarEvent> events = [
  CalendarEvent(
      title: "귀국",
      startTime: DateTime(2022, 11, 18, 0, 0),
      allDay: true,
      repeat: Repeat.none,
      memo: "드디어 귀국하는 날",
      alarm: {},
      account: accounts[0]),
  CalendarEvent(
    title: "광복절",
    startTime: DateTime(2022, 8, 15, 0, 0),
    account: accounts[1],
    repeat: Repeat.year,
    alarm: {},
    allDay: true,
  ),
];
