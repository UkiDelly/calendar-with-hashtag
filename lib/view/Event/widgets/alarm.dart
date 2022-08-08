import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/alarm._enum.dart';
import '../Alarm/alarm_picker.dart';

class AlarmWidget extends StatefulWidget {
  final Set<Alarm> alarmList;
  final Function(Set<Alarm>) getAlarmList;
  const AlarmWidget(
      {Key? key, required this.alarmList, required this.getAlarmList})
      : super(key: key);

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  // using Set because duplication is not allowed
  Set<Alarm> alarmList = {};

  @override
  void initState() {
    super.initState();
    alarmList = widget.alarmList;
  }

  //
  @override
  Widget build(BuildContext context) {
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
                useRootNavigator: true,

                context: context,

                //* show the alarm picker page then, update the alarm list
                builder: (context) => AlarmPickerView(
                  alarmList: alarmList,
                ),
              ).then((alarmList) {
                //
                setState(() {
                  // update the alarm list;
                  this.alarmList = alarmList;
                });

                // send the alarm list to the parent
                widget.getAlarmList(alarmList);
              }).whenComplete(() => null),

              // if the alarm is empty,show no alarm selected. if not null, show the list of selected alarm.  show no alarm selected
              child: alarmList.isEmpty
                  ? Text("없음",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 15))
                  : alarms(),
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
              convertAlarm(selectedAlarm),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 12.5),
            ),
          )
      ],
    );
  }
}
