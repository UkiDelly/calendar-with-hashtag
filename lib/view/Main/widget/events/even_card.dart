import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/model/global_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Event/event_detail_page.dart';

class EventCardTile extends StatefulWidget {
  final CalendarEvent event;
  const EventCardTile({Key? key, required this.event}) : super(key: key);

  @override
  State<EventCardTile> createState() => _EventCardTileState();
}

class _EventCardTileState extends State<EventCardTile> with TickerProviderStateMixin {
  late Animation<double> opcaity;
  late AnimationController animationController;

  late String startTime, endTime;

  @override
  void initState() {
    // 애니메이션 컨트롤러
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          })
          ..forward();

    // 투명도 애니메니셩
    opcaity = Tween<double>(begin: 0, end: 1).animate(animationController);

    // 날짜 포맷
    startTime = formatTime(widget.event.startTime);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get the brightness of the device
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    return CupertinoButton(
      padding: const EdgeInsets.all(0),

      //* 이벤트 상세 페이지로 이동
      onPressed: () => showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => EventDetailPage(
                event: widget.event,
              )),
      child: AnimatedOpacity(
        opacity: opcaity.value,
        duration: const Duration(milliseconds: 500),
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 0,
          //
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: brightness == Brightness.dark ? Colors.white : Colors.black),
              ),
              child: Row(
                children: [
                  //
                  //* 날짜
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        // 하루종일 일때
                        if (widget.event.allDay)
                          Text(
                            "하루종일",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        else
                          time()
                      ],
                    ),
                  ),

                  //
                  const SizedBox(
                    width: 5,
                  ),

                  // 구분선
                  Container(
                    width: 5,
                    height: 30,
                    decoration: BoxDecoration(
                        color: widget.event.account.color, borderRadius: BorderRadius.circular(25)),
                  ),

                  //
                  const SizedBox(
                    width: 5,
                  ),

                  Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* 제목
                        Text(
                          widget.event.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),

                        //* 메모
                        if (widget.event.memo != null)
                          Text(widget.event.memo!,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15))
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget time() {
    return Column(
      children: [
        // 시작 시간
        Text(
          formatTime(widget.event.startTime),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 22.5),
        ),

        // 끝나는 시간
      ],
    );
  }
}
