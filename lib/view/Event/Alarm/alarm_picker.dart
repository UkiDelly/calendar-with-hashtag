import 'package:care_square_assignment/model/alarm._enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPickerView extends StatefulWidget {
  final Set<Alarm> alarmList;
  const AlarmPickerView({Key? key, required this.alarmList}) : super(key: key);

  @override
  State<AlarmPickerView> createState() => _AlarmPickerViewState();
}

class _AlarmPickerViewState extends State<AlarmPickerView> {
  // check if it is already selected
  bool selectOrUndo(Alarm alarm) {
    return widget.alarmList.contains(alarm);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Exit Button
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
                padding: const EdgeInsets.all(15),
                onPressed: () => Navigator.of(context).pop(widget.alarmList),
                child: Icon(
                  Icons.highlight_off,
                  size: 40,
                  color: Colors.grey.shade500,
                )),
          ),

          // 알림 Text
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text(
              "알림",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          // No alarm
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              setState(() {
                // remove all selected choices
                widget.alarmList.clear();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                  color: const Color(0xfff4f4f4),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  // alarm text
                  Text(
                    convertAlarm(Alarm.none),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),

                  //
                  const Spacer(),

                  // if selected
                  if (widget.alarmList.isEmpty)
                    const Icon(
                      Icons.check,
                      color: Colors.black,
                    )

                  //
                ],
              ),
            ),
          ),

          //
          const SizedBox(
            height: 10,
          ),

          // 당일
          alarmTile(Alarm.atTime),

          //
          alarmTile(Alarm.minuteBefore),

          //
          alarmTile(Alarm.fiveMinutesBefore),

          //
          alarmTile(Alarm.tenMinutesBefore),

          //
          alarmTile(Alarm.fiftheenMinutesbefore),

          //
          alarmTile(Alarm.thirtyMinutesBefore),

          //
          alarmTile(Alarm.oneHourBefore),

          //
          alarmTile(Alarm.oneDayBefore),

          // custom
        ],
      ),
    );
  }

  //
  Widget alarmTile(Alarm alarm) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        setState(() {
          if (widget.alarmList.contains(alarm)) {
            widget.alarmList.remove(alarm);
          } else {
            // add choice
            widget.alarmList.add(alarm);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
            color: const Color(0xfff4f4f4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            // alarm text
            Text(
              convertAlarm(alarm),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.normal),
            ),

            //
            const Spacer(),

            // if selected
            if (widget.alarmList.contains(alarm))
              const Icon(
                Icons.check,
                color: Colors.black,
              )

            //
          ],
        ),
      ),
    );
  }
}
