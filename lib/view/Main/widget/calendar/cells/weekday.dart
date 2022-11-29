import 'package:care_square_assignment/constant/themes.dart';
import 'package:care_square_assignment/model/global_functions.dart';
import 'package:flutter/material.dart';

class WeekdayCell extends StatelessWidget {
  final int weekDayNumber;

  const WeekdayCell({Key? key, required this.weekDayNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return SizedBox(
      height: 40,
      child: Center(
        child: Text(weekDay(weekDayNumber),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: weekDayNumber == 6 || weekDayNumber == 7
                    ? AppColor.holidayColor
                    : brightness == Brightness.light
                        ? AppColor.defaultCellLightText
                        : AppColor.defaultCellDarkText)),
      ),
    );
  }
}
