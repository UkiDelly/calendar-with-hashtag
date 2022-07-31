import 'package:flutter/material.dart';

class WeekdayCell extends StatelessWidget {
  final String weekDayName;
  final Color? color;
  const WeekdayCell({Key? key, required this.weekDayName, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Text(
          weekDayName,
          style:  TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color
          )
        ),
      ),
    );
  }
}
