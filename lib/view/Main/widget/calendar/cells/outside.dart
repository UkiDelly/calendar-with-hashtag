import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/calendar_event.dart';
import '../../../../../provider/events_list.dart';

class OutSideCell extends StatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const OutSideCell({Key? key, required this.day, required this.events})
      : super(key: key);

  @override
  State<OutSideCell> createState() => _OutSideCellState();
}

class _OutSideCellState extends State<OutSideCell> {
  List eventsOfDay = [];

  @override
  void initState() {
    super.initState();
    eventsOfDay = widget.events!
        .where((event) =>
            event.startTime.day == widget.day.day &&
            event.startTime.month == widget.day.month)
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
                    ? const Color(0xfffac9cb)
                    : Colors.grey.withOpacity(0.8)),
          ),

          //
          const Spacer(),

           // events
          if (eventsOfDay.isNotEmpty)
            Consumer(
              builder: (ctx, ref, child) {
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

          const Spacer()
        ],
      ),
    );
  }
}
