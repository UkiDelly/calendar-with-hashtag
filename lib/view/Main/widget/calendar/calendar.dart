import 'package:care_square_assignment/provider/events_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../provider/dates.dart';
import 'cells/default.dart';
import 'cells/holiday.dart';
import 'cells/outside.dart';
import 'cells/selected.dart';
import 'cells/today.dart';
import 'cells/weekday.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  late DateTime _firstDay;
  late DateTime _lastDay;
  DateTime? _selectedDate;
  late DateTime _focusedDay = ref.watch(selectedDateProvider);

  @override
  void initState() {
    super.initState();

    // 포커스 날짜 오늘로 초기화
    _focusedDay = DateTime.now();

    // 달력이 시작하는 해
    _firstDay = DateTime.utc(2010);

    // 달력이 끝나는 해
    _lastDay = DateTime.utc(2030);
  }

  @override
  Widget build(BuildContext context) {
    final eventListHandler = ref.watch(eventListProvider.notifier);
    return TableCalendar(
      // 캘린터 범위 지정 및 포커스 날짜 지정
      focusedDay: _focusedDay,
      firstDay: _firstDay,
      lastDay: _lastDay,

      // 캘린더 설정
      // 캘린더 포맷을 월 단위로
      calendarFormat: CalendarFormat.month,
      // calendarStyle: const CalendarStyle(),

      // 현재 월을 나타내는 헤더 비활성화
      headerVisible: false,

      // 각 셀의 높이 지정
      rowHeight: 60,
      daysOfWeekHeight: 40,

      // 옆으로 넘기는 제스쳐만 허용
      availableGestures: AvailableGestures.horizontalSwipe,

      // 날짜 선택
      selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
      onDaySelected: (selectedDay, focusedDay) => setState(() {
        ref.watch(selectedDateProvider.notifier).update((state) => selectedDay);
        _selectedDate = selectedDay;
        _focusedDay = selectedDay;
      }),

      // Holiday

      // 달력 페이지가 바뀔때
      onPageChanged: (focusedDay) {
        // 현재 포커스중인 날을 변경
        _focusedDay = focusedDay;

        // 현재 날짜보다 앞으로 간 경우
        if (focusedDay.month > DateTime.now().month) {
          ref.watch(goBackTodayProvider.notifier).update((state) => 1);
        }
        // 현재 날짜보다 뒤로 간 경우
        else {
          ref.watch(goBackTodayProvider.notifier).update((state) => -1);
        }

        // 월 바꾸기
        ref.watch(currentMonthProvider.notifier).update((state) => focusedDay);
        // 선택한 날짜를 포커스중인 날짜로 변경
        ref.watch(selectedDateProvider.notifier).update((state) => focusedDay);

        //
        setState(() {
          // 현재 포커스중인 날짜의 달과 오늘 날짜의 달이 같을 경우
          if (focusedDay.month == DateTime.now().month) {
            // 선택한 날짜를 오늘 날짜로 변경
            ref.watch(selectedDateProvider.notifier).update((state) => DateTime.now());
            _selectedDate = DateTime.now();
          } else {
            // 자동적으로 포커스중인 날짜의 첫 날으로 선택한 날짜 변경
            _selectedDate = DateTime(focusedDay.year, focusedDay.month, 1);
          }
        });
      },

      // 커스텀 캘린더
      calendarBuilders: CalendarBuilders(
        // 요일
        dowBuilder: (context, day) => WeekdayCell(weekDayNumber: day.weekday),

        // 기본 셀
        defaultBuilder: (context, day, focusedDay) {
          return DefaultCell(
            day: day,
            events: eventListHandler.getEventsforDay(day),
          );
        },

        // 선택한 날짜의 셀
        selectedBuilder: (context, day, focusedDay) => SelectedCell(
          day: day,
          events: eventListHandler.getEventsforDay(day),
        ),

        // 오늘 날짜 셀
        todayBuilder: (context, day, focusedDay) => TodayCell(
          day: day,
          events: eventListHandler.getEventsforDay(day),
        ),

        // 이번 달을 제외한 날짜들의 셀
        outsideBuilder: (context, day, focusedDay) => OutSideCell(
          day: day,
          events: eventListHandler.getEventsforDay(day),
        ),

        // 공휴일 셀
        holidayBuilder: (context, day, focusedDay) => HolidayCell(
          day: day,
        ),
      ),
    );
  }
}
