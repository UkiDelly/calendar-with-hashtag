import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.utc(2010);
    _lastDay = DateTime.utc(2030);
  }

  // Calendar format
  CalendarFormat _format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      // Date range
      focusedDay: _focusedDay, firstDay: _firstDay, lastDay: _lastDay,

      // Calendar format
      calendarFormat: _format,
      onFormatChanged: (format) => setState(() {
        _format = format;
      }),

      // Day select
      selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
      onDaySelected: (selectedDay, focusedDay) => setState(() {
        _selectedDate = selectedDay;
        _focusedDay = focusedDay;
      }),

      // style
      calendarStyle: CalendarStyle(

          // Today style
          todayDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle),

          // selectedDay style
          selectedDecoration: const BoxDecoration(
              color: Colors.red,
              //borderRadius: BorderRadius.circular(25),
              shape: BoxShape.circle)),

      // Page change
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
