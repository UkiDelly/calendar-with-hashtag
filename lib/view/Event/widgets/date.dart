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
  late _DatePressed selected;

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
      // height: pressedDatePicker ? 120 : 70,
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

          if (pressedDatePicker) datePick(),

          //
          // Expanded(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       //
          //       //* 아이콘
          //       const Icon(
          //         CupertinoIcons.clock,
          //         size: 20,
          //       ),

          //       //
          //       const SizedBox(
          //         width: 10,
          //       ),

          //       //* 시작 날짜
          //       timeStart(),

          //       // arrow
          //       const Icon(
          //         CupertinoIcons.forward,
          //         size: 20,
          //       ),

          //       //* end
          //       timeEnd(),

          //       //
          //       const Spacer(),

          //       //* Allday Button
          //       CupertinoButton(
          //         padding: const EdgeInsets.all(3),
          //         onPressed: () {
          //           setState(() {
          //             allDay = !allDay;
          //             pressedDatePicker = false;

          //             if (allDay) {
          //               // set the start date to 12 am
          //               startDate = DateTime.utc(
          //                 widget.startDate.year,
          //                 widget.startDate.month,
          //                 widget.startDate.day,
          //                 0,
          //                 0,
          //               );

          //               // set the end date to 11:59 pm
          //               // endDate = DateTime.utc(
          //               //     widget.endDate.year, widget.endDate.month, widget.endDate.day, 23, 59);
          //             }

          //             //
          //             widget.getDate(startDate, allDay);
          //           });
          //         },

          //         // animtation
          //         child: AnimatedContainer(
          //           duration: const Duration(milliseconds: 700),
          //           padding: const EdgeInsets.all(5),
          //           decoration: allDay
          //               ? BoxDecoration(
          //                   borderRadius: BorderRadius.circular(25),
          //                   border: Border.all(width: 2, color: Colors.black),
          //                   color: Colors.black,
          //                 )
          //               : BoxDecoration(
          //                   borderRadius: BorderRadius.circular(25),
          //                   border: Border.all(width: 2, color: Colors.grey.shade600),
          //                 ),
          //           child: AnimatedDefaultTextStyle(
          //             duration: const Duration(milliseconds: 500),
          //             style: onAlldayEnabled(),

          //             // all Day
          //             child: const Text('하루 종일'),
          //           ),
          //         ),
          //       ),

          //       //
          //       const SizedBox(
          //         width: 10,
          //       )
          //     ],
          //   ),
          // ),

          // // Date Picker
          // if (pressedDatePicker) Expanded(child: datePick())
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
      child: allDay
          ? Text(
              '${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})',
              style: Theme.of(context).primaryTextTheme.displaySmall!,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //

                //* 날짜
                Text(
                  '${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})',
                ),

                //
                const SizedBox(
                  height: 5,
                ),

                //* 시간
                Text(
                  formatTime(startDate),
                  style:
                      Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
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
          pressedDatePicker = true;

          // 끝나는 시간을 눌렀다고 알리기
          selected = _DatePressed.endDate;
        });
      },
      child: allDay
          ? Text(
              '${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})',
              style: Theme.of(context).primaryTextTheme.displaySmall!,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                const Spacer(),

                //* 날짜
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 100),

                  // 하루종일의 값에 따라 스타일 변경
                  style: allDay
                      ? TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        )
                      : TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                  child: Text(
                    '${endDate.month}월 ${endDate.day}일 (${weekDay(endDate.weekday)})',
                  ),
                ),

                //
                const SizedBox(
                  height: 5,
                ),

                //* 시간
                AnimatedCrossFade(
                  // 하루종일이 아닐시, 시간도 표시
                  crossFadeState: allDay ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 100),

                  // 첫번째 child: 시간
                  firstChild: AnimatedOpacity(
                    opacity: allDay ? 0 : 1,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Text(
                      formatTime(endDate),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),

                  // 두번째 child: null
                  secondChild: const SizedBox(),
                ),
                const Spacer()
              ],
            ),
    );
  }

  // DatePicker
  Widget datePick() {
    return SizedBox(
      //
      height: 120,
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
