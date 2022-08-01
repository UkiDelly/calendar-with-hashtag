import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/dates.dart';
import 'add_new_event.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  String weekDayToName(DateTime day) {
    switch (day.weekday) {
      case 1:
        return "월";

      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      case 7:
        return "일";

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Date
        Consumer(
            child: null,
            builder: (context, ref, child) {
              final selectedDate = ref.watch(selectedDateProvider);
              return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                      "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 (${weekDayToName(selectedDate)})",
                      style: const TextStyle(
                          color: Color(0xff313131),
                          fontWeight: FontWeight.w900,
                          fontSize: 20)));
            }),

        //* Event List

        //* Add new Event with Template
        const AddNewEvent()
      ],
    );
  }
}
