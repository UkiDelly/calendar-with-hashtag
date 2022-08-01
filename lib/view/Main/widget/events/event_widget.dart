import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final List<CalendarEvent> events;
  const EventCard({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          height: 15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: events[index].color.withOpacity(0.1)),
          child: Row(
            children: [
              //
              VerticalDivider(
                color: events[index].color,
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),

              // event title
              Text(
                events[index].title,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
