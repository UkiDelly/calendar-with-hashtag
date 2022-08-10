import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/calendar_event.dart';

class TodayCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const TodayCell({
    Key? key,
    required this.day,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //
          const SizedBox(
            height: 5,
          ),
          //* 날짜
          Text(
            day.day.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),

          //
          const Spacer(),

          //* 이벤트 표시
          if (events!.isNotEmpty)
            Consumer(
              builder: (ctx, ref, child) {
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: events!.first.account.color),
                );
              },
            ),

          const Spacer()
        ],
      ),
    );
  }
}
