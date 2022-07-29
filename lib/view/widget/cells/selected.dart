import 'package:flutter/material.dart';

class SelectedCell extends StatelessWidget {
  final DateTime day;
  const SelectedCell({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff313131)),
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
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
