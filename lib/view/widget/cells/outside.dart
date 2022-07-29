import 'package:flutter/material.dart';

class OutSideCell extends StatelessWidget {
  final DateTime day;
  const OutSideCell({Key? key, required this.day}) : super(key: key);

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
                    ? const Color(0xfffac9cb)
                    : Colors.grey.withOpacity(0.8)),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
