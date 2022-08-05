import 'package:flutter/material.dart';

import '../../../../../model/calendar_event.dart';

class TodayCell extends StatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const TodayCell({
    Key? key,
    required this.day,
    required this.events,
  }) : super(key: key);

  @override
  State<TodayCell> createState() => _TodayCellState();
}

class _TodayCellState extends State<TodayCell> {
  List eventsOfDay = [];

  @override
  void initState() {
    super.initState();
    eventsOfDay = widget.events!
        .where((event) => event.startTime.day == widget.day.day)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
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
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),

          //
          const Spacer(),

          // events
          if (eventsOfDay.isNotEmpty)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: eventsOfDay.first.account.color),
            ),

          const Spacer()
        ],
      ),
    );
  }
}
