import 'account.dart';
import 'alarm._enum.dart';
import 'repeat_enum.dart';

class CalendarEvent {
  final String title;
  final DateTime startTime, endTime;
  final bool allDay;
  final Account account;
  Repeat? repeat;
  Set<Alarm> alarm;
  String? location, url, memo;

  CalendarEvent(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.account,
      required this.alarm,
      required this.allDay,
      this.repeat,
      this.location,
      this.url,
      this.memo});

  @override
  String toString() {
    return "CalendarEvent(title: $title, startTime: $startTime, endTime: $endTime, account: ${account.name}, alarm: $alarm , location: $location, url: $url, memo: $memo,)";
  }
}
