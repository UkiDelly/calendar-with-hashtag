import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentMonthProvider = StateProvider<int>((ref) {
  return DateTime.now().month;
});
