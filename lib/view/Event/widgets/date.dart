import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/global_functions.dart';

class TimePick extends StatefulWidget {
  final Function(DateTime startDate, DateTime endDate, bool allDay) getDate;
  final DateTime startDate, endDate;
  final bool allDay;
  const TimePick(
      {Key? key,
      required this.startDate,
      required this.endDate,
      required this.getDate,
      required this.allDay})
      : super(key: key);

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
    // set the initial date

    startDate = widget.startDate;
    // set the initial date
    endDate = widget.endDate;
    allDay = widget.allDay;
  }

  // text style when allDayButton is enabled or disabled
  TextStyle onAlldayEnabled() {
    if (allDay) {
      return const TextStyle(color: Colors.white, fontSize: 15);
    }
    return TextStyle(color: Colors.grey.shade600, fontSize: 15);
  }

  @override
  Widget build(BuildContext context) {
    // parent state
    // AddNewEventPageState pageState =
    //     context.findAncestorStateOfType<AddNewEventPageState>()!;
    return SizedBox(
      height: pressedDatePicker ? 120 : 70,
      child: Column(
        children: [
          //
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                //* Icon
                const Icon(
                  CupertinoIcons.clock,
                  size: 20,
                ),

                //
                const SizedBox(
                  width: 10,
                ),

                //* start
                ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 110,
                    ),
                    child: timeStart()),

                // arrow
                const Icon(
                  CupertinoIcons.forward,
                  size: 20,
                ),

                //* end
                ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 115),
                    child: timeEnd()),

                //
                const Spacer(),

                //* Allday Button
                CupertinoButton(
                  padding: const EdgeInsets.all(3),
                  onPressed: () {
                    setState(() {
                      allDay = !allDay;
                      pressedDatePicker = false;

                      if (allDay) {
                        // set the start date to 12 am
                        startDate = DateTime.utc(widget.startDate.year,
                            widget.startDate.month, widget.startDate.day, 0, 0);

                        // set the end date to 11:59 pm
                        endDate = DateTime.utc(widget.endDate.year,
                            widget.endDate.month, widget.endDate.day, 23, 59);
                      }

                      //
                      widget.getDate(startDate, endDate, allDay);
                    });
                  },

                  // animtation
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    padding: const EdgeInsets.all(5),
                    decoration: allDay
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 2, color: Colors.black),
                            color: Colors.black,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 2, color: Colors.grey.shade600)),
                    child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 500),
                        style: onAlldayEnabled(),

                        // all Day
                        child: const Text("하루 종일")),
                  ),
                ),

                //
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),

          // Date Picker
          if (pressedDatePicker) Expanded(child: datePick())
        ],
      ),
    );
  }

  //* select the start date
  Widget timeStart() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () => setState(() {
        pressedDatePicker = true;
        selected = _DatePressed.startDate;
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          const Spacer(),

          //* Date
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: allDay
                ? TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor)
                : TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
            child: Text(
              "${startDate.month}월 ${startDate.day}일 (${weekDay(startDate.weekday)})",
            ),
          ),

          //
          const SizedBox(
            height: 5,
          ),

          //* Time
          AnimatedCrossFade(
            // show the time if allday is false
            crossFadeState:
                allDay ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 100),

            // first child, show the time
            firstChild: AnimatedOpacity(
              opacity: allDay ? 0 : 1,
              duration: const Duration(milliseconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Text(
                formatTime(startDate),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ),

            // secod child, nothing
            secondChild: const SizedBox(),
          ),
          const Spacer()
        ],
      ),
    );
  }

  //* select the end date
  Widget timeEnd() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        setState(() {
          pressedDatePicker = true;
          selected = _DatePressed.endDate;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          const Spacer(),

          //* Date
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: allDay
                ? TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor)
                : TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
            child: Text(
              "${endDate.month}월 ${endDate.day}일 (${weekDay(endDate.weekday)})",
            ),
          ),

          //
          const SizedBox(
            height: 5,
          ),

          //* Time
          AnimatedCrossFade(
            // show the time if allday is false
            crossFadeState:
                allDay ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 100),

            // first child, show the time
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

            // secod child, nothing
            secondChild: const SizedBox(),
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget datePick() {
    return SizedBox(
      //
      child: CupertinoDatePicker(
        // inial date
        initialDateTime: selected == _DatePressed.startDate
            ? startDate
            : DateTime(
                endDate.year, endDate.month, endDate.day, endDate.hour, 55),

        dateOrder: DatePickerDateOrder.ymd,
        minuteInterval: 5,

        // when the date change
        onDateTimeChanged: (value) {
          // check if start date
          if (selected == _DatePressed.startDate) {
            startDate = value;
            endDate = DateTime(
              startDate.year,
              startDate.month,
              startDate.day,
              endDate.hour,
              endDate.minute,
            );

            // or end date
          } else {
            endDate = value;
          }

          // update the date
          setState(() {
            startDate;
            endDate;
          });

          // call back
          widget.getDate(startDate, endDate, allDay);
        },
      ),
    );
  }
}
