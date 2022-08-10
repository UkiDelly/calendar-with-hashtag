import 'package:care_square_assignment/model/calendar_event.dart';

import 'package:flutter/material.dart';

class DefaultCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const DefaultCell({Key? key, required this.day, this.events})
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

                // 주말일 경우 색변경
                color: day.weekday == 6 || day.weekday == 7
                    ? Colors.red
                    : const Color(0xff313131)),
          ),

          //
          const Spacer(),

          //* 이벤트가 있을 경우 표시
          if (events!.isNotEmpty)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: events?.first.account.color),
            ),

          //
          const Spacer()
        ],
      ),
    );
  }
}
