import 'package:flutter/material.dart';

import '../../model/calendar_event.dart';

class EventDetailPage extends StatelessWidget {
  final CalendarEvent event;
  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
