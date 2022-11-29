import 'account.dart';
import 'alarm._enum.dart';
import 'repeat_enum.dart';

class CalendarEvent {
  final String title;
  final DateTime startTime;
  // final DateTime endTime;
  final bool allDay;
  final Account account;
  Repeat repeat;
  Set<Alarm> alarm;
  String? location, url, memo;

  CalendarEvent(
      {required this.title,
      required this.startTime,
      // required this.endTime,
      required this.account,
      required this.alarm,
      required this.allDay,
      required this.repeat,
      this.location,
      this.url,
      this.memo});

  @override
  String toString() {
    return "CalendarEvent(title: $title, startTime: $startTime, repeat: $repeat, account: ${account.name}, alarm: $alarm , location: $location, url: $url, memo: $memo,)";
  }

  CalendarEvent copyWith({
    String? title,
    DateTime? startTime,
    endTime,
    bool? allDay,
    Account? account,
    Repeat? repeat,
    Set<Alarm>? alarm,
    String? location,
    url,
    memo,
  }) {
    return CalendarEvent(
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      // endTime: endTime ?? this.endTime,
      allDay: allDay ?? this.allDay,
      account: account ?? this.account,
      repeat: repeat ?? this.repeat,
      alarm: alarm ?? this.alarm,
      memo: memo ?? this.memo,
    );
  }
}
