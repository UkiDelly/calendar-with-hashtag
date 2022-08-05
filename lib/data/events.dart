import 'package:care_square_assignment/data/accounts.dart';
import 'package:care_square_assignment/model/calendar_event.dart';

List<CalendarEvent> events = [
  CalendarEvent(
      title: "진료",
      startTime: DateTime(2022, 8, 2, 0, 0),
      endTime: DateTime(2022, 8, 2, 23, 59),
      memo: "오늘은 진료가 있는날",
      alarm: {},
      account: accounts[0]),
];
