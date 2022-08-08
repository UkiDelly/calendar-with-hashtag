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

class _EventCardTileState extends State<EventCardTile>
    with TickerProviderStateMixin {
  // animation
  late Animation<double> opcaity;
  late AnimationController animationController;

  var startTime, endTime;

  @override
  void initState() {
    // Animation controller
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      })
      ..forward();

    //animtaion
    opcaity = Tween<double>(begin: 0, end: 1).animate(animationController);

    // date format
    startTime = formatTime(widget.event.startTime);
    endTime = formatTime(widget.event.endTime);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //animation
    return CupertinoButton(
      padding: const EdgeInsets.all(0),

      //* go to event detail
      onPressed: () => showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => EventDetailPage(
                event: widget.event,
              )),
      child: AnimatedOpacity(
        opacity: opcaity.value,
        duration: const Duration(milliseconds: 500),
        child: Card(
          color: const Color(0xfff4f4f4),
          elevation: 0,

          //
          child: Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  //
                  //* Date
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        // if all day
                        if (widget.event.allDay)
                          Text(
                            "하루종일",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        else
                          time()
                      ],
                    ),
                  ),

                  // Divider
                  Container(
                    width: 5,
                    height: 30,
                    decoration: BoxDecoration(
                        color: widget.event.account.color,
                        borderRadius: BorderRadius.circular(25)),
                  ),

                  //
                  const SizedBox(
                    width: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* title
                        Text(
                          widget.event.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),

                        //* description
                        if (widget.event.memo != null)
                          Text(widget.event.memo!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 15))
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
        // Start time
        Text(
          formatTime(widget.event.startTime),
          style: Theme.of(context).textTheme.headline5,
        ),

        // End Time
        Text(
          formatTime(widget.event.endTime),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }
}
