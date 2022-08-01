import 'package:flutter_riverpod/flutter_riverpod.dart';

// listen for the months when calendar pages are chagnge
final currentMonthProvider = StateProvider<int>((ref) {
  return DateTime.now().month;
});

// listen when the calendar page is not the current month
final goBackTodayProvider = StateProvider<int>((ref) => 0);

// listen for the selected day
final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final allDayProvider = StateProvider<bool>((ref) => false);
