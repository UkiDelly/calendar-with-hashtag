import 'package:care_square_assignment/view/New%20Event/Alarm/alarm_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/alarm._enum.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({Key? key}) : super(key: key);

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  // using Set because duplication is not allowed
  Set<Alarm> alarmList = {};

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

        //* Alarm
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),

              //* go to alarm selection page
              onPressed: () => showCupertinoModalBottomSheet(
                context: context,

                //* show the alarm picker page then, update the alarm list
                builder: (context) => AlarmPickerView(
                  alarmList: alarmList,
                ),
              ).then((alarmList) => setState(() {
                    // update the alarm list;
                    this.alarmList = alarmList;
                  })),

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
