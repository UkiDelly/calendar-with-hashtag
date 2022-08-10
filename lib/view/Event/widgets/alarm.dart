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
  //! 중복을 허용하지 않기 위해 Set을 이용
  Set<Alarm> alarmList = {};

  @override
  void initState() {
    super.initState();

    // 넘겨 받은 데이터로 초기화
    alarmList = widget.alarmList;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //* 아이콘
        const Icon(CupertinoIcons.bell),

        //
        const SizedBox(
          width: 10,
        ),

        //* 알림
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),

              //* 알림 선택 페이지로
              onPressed: () => showCupertinoModalBottomSheet(
                useRootNavigator: true,

                context: context,

                //* 알림 선택 페이지에서 돌아올때 넘겨 받은 데이터로 업데이트
                builder: (context) => AlarmPickerView(
                  alarmList: alarmList,
                ),
              ).then((alarmList) {
                //
                setState(() {
                  // 업데이트
                  this.alarmList = alarmList;
                });

                // 콜백
                widget.getAlarmList(alarmList);
              }).whenComplete(() => null),

              // 알림 Set가 비었을때 "없음" 표시하고, 있으면 선택한 알람들을 디스플레이

              child: alarmList.isEmpty
                  ? Text("없음",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 15))
                  // 알림 디스플레이
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
            // 문자열로 변환
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
