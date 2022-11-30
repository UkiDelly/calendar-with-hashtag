import 'package:flutter_riverpod/flutter_riverpod.dart';

// listen for the months when calendar pages are chagnge
final currentMonthProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

// listen for the selected day
final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
