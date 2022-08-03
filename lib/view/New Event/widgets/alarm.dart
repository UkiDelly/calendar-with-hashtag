import 'package:flutter/cupertino.dart';

import '../../../model/alarm._enum.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({Key? key}) : super(key: key);

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  // using Set because duplication is not allowed
  Set<Alarm> alarmList = {
    Alarm.atTime,
    Alarm.minuteBefore,
    Alarm.fiveMinutesBefore,
    Alarm.tenMinutesBefore,
    Alarm.fiftheenMinutesbefore,
    Alarm.thirtyMinutesBefore,
    Alarm.oneHourBefore,
    Alarm.oneDayBefore
  };

  //
  @override
  Widget build(BuildContext context) {
    print(alarmList);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //* Icon
        const Icon(CupertinoIcons.bell),

        //
        const SizedBox(
          width: 10,
        ),

        // Alarm
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),

              //* go to alarm selection page
              onPressed: () => setState(() {
                alarmList.clear();
              }),

              // if the alarm is null, show the list of selected alarms, if not null, show no alarm selected
              child: alarmList.isEmpty ? const Text("없음") : alarms(),
            ),
          ),
        ),
      ],
    );
  }

  Widget alarms() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 5,
      children: [
        // loop the list
        for (Alarm selectedAlarm in alarmList)
          Container(
            padding: const EdgeInsets.all(7.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xfff4f4f4)),
            child: Text(
              convertEnum(selectedAlarm),
              style: const TextStyle(fontSize: 12.5),
            ),
          )
      ],
    );
  }
}
