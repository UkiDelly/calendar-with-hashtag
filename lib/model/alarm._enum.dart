enum Alarm {
  none,
  atTime,
  minuteBefore,
  fiveMinutesBefore,
  tenMinutesBefore,
  fiftheenMinutesbefore,
  thirtyMinutesBefore,
  oneHourBefore,
  oneDayBefore,
}

@override
convertAlarm(Alarm a) {
  switch (a) {
    case Alarm.none:
      return "없음";
    case Alarm.atTime:
      return "이벤트 당시";
    case Alarm.minuteBefore:
      return "1분 전";
    case Alarm.fiveMinutesBefore:
      return "5분 전";
    case Alarm.tenMinutesBefore:
      return "10분 전";
    case Alarm.fiftheenMinutesbefore:
      return "15분 전";
    case Alarm.thirtyMinutesBefore:
      return "30분 전";
    case Alarm.oneHourBefore:
      return "1시간 전";
    case Alarm.oneDayBefore:
      return "1일 전";
  }
}
