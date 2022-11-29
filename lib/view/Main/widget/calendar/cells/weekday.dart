import 'package:care_square_assignment/constant/themes.dart';
import 'package:care_square_assignment/model/global_functions.dart';
import 'package:flutter/material.dart';

class WeekdayCell extends StatelessWidget {
  final int weekDayNumber;

  const WeekdayCell({Key? key, required this.weekDayNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          weekDay(weekDayNumber),
          style: Theme.of(context).primaryTextTheme.bodySmall!.copyWith(
                color: weekDayNumber == 6 || weekDayNumber == 7 ? AppColor.holidayColor : null,
              ),
        ),
      ),
    );
  }
}
