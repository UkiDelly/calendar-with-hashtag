import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constant/themes.dart';
import '../../../../../model/event_model.dart';

class OutSideCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEventModel>? events;
  const OutSideCell({Key? key, required this.day, required this.events}) : super(key: key);

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
            style: Theme.of(context).primaryTextTheme.bodySmall!.copyWith(
                  color: day.weekday == 6 || day.weekday == 7
                      ? AppColor.holidayColor.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow, // events!.first.account.color
                  ),
                );
              },
            ),

          const Spacer()
        ],
      ),
    );
  }
}
