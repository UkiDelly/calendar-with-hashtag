import 'package:care_square_assignment/provider/current_month.dart';
import 'package:care_square_assignment/view/widget/cells/default.dart';
import 'package:care_square_assignment/view/widget/cells/holiday.dart';
import 'package:care_square_assignment/view/widget/cells/outside.dart';
import 'package:care_square_assignment/view/widget/cells/selected.dart';
import 'package:care_square_assignment/view/widget/cells/today.dart';
import 'package:care_square_assignment/view/widget/cells/weekday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
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
  final CalendarFormat _format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // calendar
        TableCalendar(
          // Date range
          focusedDay: _focusedDay,
          firstDay: _firstDay,
          lastDay: _lastDay,

          // Calendar format
          calendarFormat: _format,

          // Day select
          selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
          onDaySelected: (selectedDay, focusedDay) => setState(() {
            _selectedDate = selectedDay;
            _focusedDay = selectedDay;
          }),

          // style
          calendarStyle: const CalendarStyle(),

          // Page change
          onPageChanged: (focusedDay) {
            // change the Month
            ref
                .watch(currentMonthProvider.notifier)
                .update((state) => focusedDay.month);
            setState(() {
              _focusedDay = focusedDay;
              // auto select the first day of the month
              _selectedDate = DateTime(focusedDay.year, focusedDay.month, 1);
            });
          },

          // header
          headerVisible: false,

          // height of the cells
          rowHeight: 60,

          // only horizontal swipe is able
          availableGestures: AvailableGestures.horizontalSwipe,

          // calendar builder
          calendarBuilders: CalendarBuilders(
              // weekday name builder
              dowBuilder: (context, day) {
                switch (day.weekday) {
                  case 1:
                    return const WeekdayCell(weekDayName: "월");
                  case 2:
                    return const WeekdayCell(weekDayName: "화");
                  case 3:
                    return const WeekdayCell(weekDayName: "수");
                  case 4:
                    return const WeekdayCell(weekDayName: "목");
                  case 5:
                    return const WeekdayCell(weekDayName: "금");
                  case 6:
                    return const WeekdayCell(
                      weekDayName: "토",
                      color: Colors.red,
                    );
                  case 7:
                    return const WeekdayCell(
                        weekDayName: "일", color: Colors.grey);
                }
                return null;
              },

              // default day
              defaultBuilder: (context, day, focusedDay) =>
                  DefaultCell(day: day),

              // select builder
              selectedBuilder: (context, day, focusedDay) =>
                  SelectedCell(day: day),

              // today builder
              todayBuilder: (context, day, focusedDay) => TodayCell(day: day),

              // outside builder
              outsideBuilder: (context, day, focusedDay) =>
                  OutSideCell(day: day),

              // holiday builder
              holidayBuilder: (context, day, focusedDay) => HolidayCell(
                    day: day,
                  )),
        ),
      ],
    );
  }
}
