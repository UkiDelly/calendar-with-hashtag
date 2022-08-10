import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/calendar_event.dart';

class OutSideCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const OutSideCell({Key? key, required this.day, required this.events})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            style: TextStyle(
                fontWeight: FontWeight.bold,

                // 주말일 경우, 색변경
                color: day.weekday == 6 || day.weekday == 7
                    ? const Color(0xfffac9cb)
                    : Colors.grey.withOpacity(0.8)),
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
