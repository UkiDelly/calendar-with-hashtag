import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../provider/events_list.dart';

class SelectedCell extends ConsumerStatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const SelectedCell({Key? key, required this.day, this.events})
      : super(key: key);

  @override
  ConsumerState<SelectedCell> createState() => _SelectedCellState();
}

class _SelectedCellState extends ConsumerState<SelectedCell>
    with TickerProviderStateMixin {
  //
  late AnimationController _animationController;
  late Animation _opacity;
  List<CalendarEvent> eventsOfDay = [];

  @override
  void initState() {
    // animation controller
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward()
          ..addListener(() {
            setState(() {});
          });

    //animation
    _opacity = Tween<double>(begin: 0, end: 1).animate(_animationController);

    // filter events
    eventsOfDay = widget.events!
        .where((event) => event.startTime.day == widget.day.day)
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Opacity(
      opacity: _opacity.value,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff313131)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            const SizedBox(
              height: 5,
            ),
            // date
            Text(
              widget.day.day.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),

            //
            const Spacer(),

            // events
            if (eventsOfDay.isNotEmpty)
              Consumer(
                builder: (ctx, ref, child) {
                  List<CalendarEvent>? event = ref
                      .watch(eventListProvider.notifier)
                      .getEventsforDay(widget.day);
                  return Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: event!.first.account.color),
                  );
                },
              ),

            const Spacer()
          ],
        ),
      ),
    );
  }
}
