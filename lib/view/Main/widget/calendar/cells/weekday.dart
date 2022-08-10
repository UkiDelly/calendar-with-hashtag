import 'package:care_square_assignment/model/global_functions.dart';
import 'package:flutter/material.dart';

class WeekdayCell extends StatelessWidget {
  final int weekDayNumber;

  const WeekdayCell({Key? key, required this.weekDayNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Text(weekDay(weekDayNumber),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,

                // 토요일일 경우 빨간색
                color: weekDayNumber == 6
                    ? Colors.red

                    // 일요일일 경우 회색
                    : weekDayNumber == 7
                        ? Colors.grey
                        : Colors.black)),
      ),
    );
  }
}
