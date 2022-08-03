enum Repeat {
  none,
  day,
  week,
  twoWeek,
  month,
  year,
}

convertEnum(Repeat r) {
  switch (r) {
    case Repeat.day:
      return "매일";
    case Repeat.week:
      return "매주";
    case Repeat.twoWeek:
      return "2주";
    case Repeat.month:
      return "매월";
    case Repeat.year:
      return "매년";

    default:
      return "반복 없음";
  }
}
