import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

@freezed
class CalendarEventModel with _$CalendarEventModel {
  factory CalendarEventModel({
    // required String id,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    String? description,
    // required Account account,
    // required Repeat repeat,
    // required Alarm alarm,
    required bool allDay,
    String? memo,
  }) = _CalendarEventModel;

  // factory CalendarEventModel.fromJson(Map<String, dynamic> json) => _$CalendarEventModelFromJson(json);
}

// class CalendarEventModel {
//   final String title;
//   final DateTime startTime;
//   // final DateTime endTime;
//   final bool allDay;
//   final Account account;
//   Repeat repeat;
//   Set<Alarm> alarm;
//   String? location, url, memo;

//   CalendarEventModel(
//       {required this.title,
//       required this.startTime,
//       // required this.endTime,
//       required this.account,
//       required this.alarm,
//       required this.allDay,
//       required this.repeat,
//       this.location,
//       this.url,
//       this.memo});


// }
