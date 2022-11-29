import 'package:care_square_assignment/constant/themes.dart';
import 'package:flutter/material.dart';

import '../../../../../model/event_model.dart';

class DefaultCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEventModel>? events;
  const DefaultCell({Key? key, required this.day, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

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
                      ? AppColor.holidayColor
                      : brightness == Brightness.light
                          ? AppColor.defaultCellLightText
                          : AppColor.defaultCellDarkText,
                  fontWeight: FontWeight.bold,
                ),
          ),

          //
          const Spacer(),

          //* 이벤트가 있을 경우 표시
          if (events!.isNotEmpty)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow, //?.first.account.color
              ),
            ),

          //
          const Spacer()
        ],
      ),
    );
  }
}
