import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../provider/dates.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  String weekDayToName(DateTime day) {
    switch (day.weekday) {
      case 1:
        return "월";

      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      case 7:
        return "일";

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Date
        Consumer(
            child: null,
            builder: (context, ref, child) {
              final selectedDate = ref.watch(selectedDateProvider);
              return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                      "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 (${weekDayToName(selectedDate)})",
                      style: const TextStyle(
                          color: Color(0xff313131),
                          fontWeight: FontWeight.bold,
                          fontSize: 30)));
            }),

        //* Event List

        //* Add new Event with Template
        SizedBox(
          child: Row(
            children: [
              //* Add new Event
              Expanded(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                width: 75,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  // when tap
                  onTap: () {},

                  // decoration
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Colors.white.withOpacity(0.5),
                  hoverColor: Colors.white.withOpacity(0.5),
                  splashColor: Colors.white.withOpacity(0.5),
                  overlayColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
                  //TODO: make the color white with opacity 50% when it pressed.

                  //
                  child: Row(
                    children: const [
                      //
                      SizedBox(width: 10),

                      // + icon
                      Icon(
                        Icons.add,
                        size: 35,
                      ),

                      //
                      SizedBox(
                        width: 10,
                      ),

                      // text
                      Text(
                        "새로운 이벤트",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )),

              //* Template
              Container(
                width: 75,
                height: 60,
                margin: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  'assets/icon/document.svg',
                  height: 10,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
