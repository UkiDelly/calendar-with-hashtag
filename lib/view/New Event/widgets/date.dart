import 'package:care_square_assignment/model/repeat_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/global_functions.dart';

class TimePick extends StatefulWidget {
  DateTime day;
  TimePick({Key? key, required this.day}) : super(key: key);

  @override
  State<TimePick> createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  //
  bool allDay = false;
  late DateTime startDate, endDate;
  Repeat repeat = Repeat.none;

  @override
  void initState() {
    super.initState();
    // set the initial date
    startDate =
        DateTime.utc(widget.day.year, widget.day.month, widget.day.day, 0, 0);

    // set the initial date
    endDate =
        DateTime.utc(widget.day.year, widget.day.month, widget.day.day, 23, 59);
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
    return SizedBox(
      height: 70,
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
                      border:
                          Border.all(width: 2, color: Colors.grey.shade600)),
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
    );
  }

  //* select the start date
  Widget timeStart() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {},
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
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: CupertinoTheme.of(context).primaryColor)
                : TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: CupertinoTheme.of(context).primaryColor),
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
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
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
      onPressed: () {},
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
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: CupertinoTheme.of(context).primaryColor)
                : TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: CupertinoTheme.of(context).primaryColor),
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
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
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
}
