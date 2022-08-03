// convert weekDay to String
import 'package:intl/intl.dart';

String weekDay(int day) {
  switch (day) {
    case 1:
      return "월";
    case 2:
      return "화";
    case 3:
      return "수";
    case 4:
      return "목";
    case 5:
      return "금";
    case 6:
      return "토";
    case 7:
      return "일";
    default:
      return "";
  }
}

// format time to am and pm
String formatTime(DateTime day) {
  var time = DateFormat.jm().format(day);

  return time.toString();
}
