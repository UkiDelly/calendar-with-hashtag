import 'package:care_square_assignment/model/calendar_event.dart';

import 'package:flutter/material.dart';

import '../event_widget.dart';

class DefaultCell extends StatelessWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const DefaultCell({Key? key, required this.day, this.events})
      : super(key: key);

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

          // events
          events != null
              ? EventCard(
                  events: events!,
                )
              : const SizedBox(),

          const Spacer()
        ],
      ),
    );
  }
}
