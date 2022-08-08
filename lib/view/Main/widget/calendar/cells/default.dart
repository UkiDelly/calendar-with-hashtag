import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/provider/events_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultCell extends StatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const DefaultCell({Key? key, required this.day, this.events})
      : super(key: key);

  @override
  State<DefaultCell> createState() => _DefaultCellState();
}

class _DefaultCellState extends State<DefaultCell> {
  List<CalendarEvent> eventsOfDay = [];

  @override
  void initState() {
    super.initState();
    eventsOfDay = widget.events!
        .where((event) => event.startTime.day == widget.day.day)
        .toList();
  }

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
            widget.day.day.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,

                // if weekend, change color to red
                color: widget.day.weekday == 6 || widget.day.weekday == 7
                    ? Colors.red
                    : const Color(0xff313131)),
          ),

          //
          const Spacer(),

           // events
          if (eventsOfDay.isNotEmpty)
            Consumer(
              builder: (ctx, ref, child) {

                // get the event for days
                List<CalendarEvent> event = ref
                    .watch(eventListProvider.notifier)
                    .getEventsforDay(widget.day);
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: event.first.account.color),
                );
              },
            ),

          //
          const Spacer()
        ],
      ),
    );
  }
}
