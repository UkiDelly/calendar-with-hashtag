import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/global_functions.dart';

class TimePick extends StatefulWidget {
  final Function(DateTime startDate, bool allDay) getDate;
  final DateTime startDate, endDate;
  final bool allDay;
  const TimePick({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.getDate,
    required this.allDay,
  }) : super(key: key);

  @override
  State<TimePick> createState() => _TimePickState();
}

enum _DatePressed { startDate, endDate }

class _TimePickState extends State<TimePick> {
  //
  late bool allDay;
  late DateTime startDate, endDate;
  bool pressedDatePicker = false;
  _DatePressed? selected;

  @override
  void initState() {
    super.initState();

    // 넘겨 받은 날짜 데이터로 초기화
    startDate = widget.startDate;
    endDate = widget.endDate;
    allDay = widget.allDay;
  }

  // 하루종일 버튼을 눌렀을때 텍스트 스타일 결정
  TextStyle onAlldayEnabled() {
    if (allDay) {
      return const TextStyle(color: Colors.white, fontSize: 15);
    }
    return TextStyle(color: Colors.grey.shade600, fontSize: 15);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.clock,
                size: 20,
                color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
              ),
              const SizedBox(
                width: 5,
              ),
              timeStart(),
              Icon(
                Icons.navigate_next,
                size: 30,
                color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
              ),
              timeEnd(),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  allDay = !allDay;

                  setState(() {
                    allDay;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    '하루종일',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .labelMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: pressedDatePicker ? 120 : 0.0001,
            child: datePick(),
          ),
        ],
      ),
    );
  }

  //* 시작 날짜 고르기
  Widget timeStart() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),

      //
      onPressed: () => setState(() {
        // 위젯을 누르면 DatePicker을 보여줌
        pressedDatePicker = !pressedDatePicker;

        // 시작날짜를 눌렀다고 알리기
        selected = _DatePressed.startDate;
      }),
      child: AnimatedCrossFade(
        firstChild: Text(
          '${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})',
          style: Theme.of(context).primaryTextTheme.titleSmall!,
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // const Spacer(),

            //* 날짜
            Text(
              '${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})',
              style: Theme.of(context).primaryTextTheme.displaySmall!,
            ),

            //

            //* 시간
            Text(
              formatTime(startDate),
              style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        crossFadeState: allDay ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 100),
      ),
    );
  }

  //* 끝나는 시간
  Widget timeEnd() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      //
      onPressed: () {
        setState(() {
          // DatePicker 위젯 호출
          pressedDatePicker = !pressedDatePicker;

          // 끝나는 시간을 눌렀다고 알리기
          selected = _DatePressed.endDate;
        });
      },
      child: AnimatedCrossFade(
        firstChild: Text(
          '${endDate.month}월 ${endDate.day}일 (${weekDay(endDate.weekday)})',
          style: Theme.of(context).primaryTextTheme.titleSmall!,
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // const Spacer(),

            //* 날짜
            Text(
              '${endDate.month}월 ${endDate.day}일 (${weekDay(endDate.weekday)})',
              style: Theme.of(context).primaryTextTheme.displaySmall!,
            ),

            //

            //* 시간
            Text(
              formatTime(endDate),
              style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        crossFadeState: allDay ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 100),
      ),
    );
  }

  // DatePicker
  Widget datePick() {
    return SizedBox(
      //
      child: CupertinoDatePicker(
        // 날짜 초기화
        initialDateTime: selected == _DatePressed.startDate
            ? startDate //: DateTime.now(),
            : DateTime(endDate.year, endDate.month, endDate.day, endDate.hour, 55),

        dateOrder: DatePickerDateOrder.ymd,
        minuteInterval: 5,

        // 날짜가 바뀔때
        onDateTimeChanged: (date) {
          // 시작 날짜를 바꿀시,
          if (selected == _DatePressed.startDate) {
            //
            startDate = date;

            // 끝나는 날짜를 시작하는 날짜와 맞추기
            endDate = DateTime(
              startDate.year,
              startDate.month,
              startDate.day,
              endDate.hour,
              endDate.minute,
            );
          } else {
            endDate = date;
          }

          // 날짜 업데이트
          setState(() {
            startDate;
            // endDate;
          });

          // 콜백 함수
          widget.getDate(startDate, allDay);
        },
      ),
    );
  }
}
