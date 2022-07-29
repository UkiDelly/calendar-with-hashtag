import 'package:flutter/material.dart';

class DefaultCell extends StatelessWidget {
  final DateTime day;
  const DefaultCell({Key? key, required this.day}) : super(key: key);

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
          // date
          Text(
            day.day.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,

                // if weekend, change color to red
                color: day.weekday == 6 || day.weekday == 7
                    ? Colors.red
                    : const Color(0xff313131)),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
