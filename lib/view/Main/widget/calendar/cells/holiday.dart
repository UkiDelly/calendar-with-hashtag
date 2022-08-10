import 'package:flutter/material.dart';

class HolidayCell extends StatelessWidget {
  final DateTime day;
  const HolidayCell({Key? key, required this.day}) : super(key: key);

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
            style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
