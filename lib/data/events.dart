import 'package:care_square_assignment/model/event_model.dart';

List<CalendarEventModel> events = [
  CalendarEventModel(
    title: '귀국',
    startTime: DateTime(2022, 11, 18, 0, 0),
    endTime: DateTime(2022, 11, 18, 23, 59),
    allDay: true,
    // repeat: Repeat.none,
    memo: '드디어 귀국하는 날',
    // alarm: {},
    // account: accounts[0]),
  ),
  CalendarEventModel(
    title: '광복절',
    startTime: DateTime(2022, 11, 18, 0, 0),
    endTime: DateTime(2022, 11, 18, 23, 59),
    // account: accounts[1],
    // repeat: Repeat.year,
    // alarm: {},
    allDay: true,
  ),
];
