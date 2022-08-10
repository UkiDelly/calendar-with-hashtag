import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/model/global_functions.dart';
import 'package:care_square_assignment/provider/events_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/dates.dart';

import 'new_event_card.dart';
import 'even_card.dart';

class EventList extends ConsumerWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    DateTime selectedDate = ref.watch(selectedDateProvider);
    List<CalendarEvent> eventList =
        ref.watch(eventListProvider.notifier).getEventsforDay(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        //* 날짜
        Consumer(
            child: null,
            builder: (context, ref, child) {
              final selectedDate = ref.watch(selectedDateProvider);
              return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                      "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 (${weekDay(selectedDate.weekday)})",
                      style: Theme.of(context).textTheme.titleMedium));
            }),

        //* 이벤트 리스트
        ListView.builder(
          shrinkWrap: true,
          itemCount: eventList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          itemBuilder: (context, index) {
            return EventCardTile(
              event: eventList[index],
            );
          },
        ),

        //* 새 이벤트 추가
        const AddNewEvent()
      ],
    );
  }
}
