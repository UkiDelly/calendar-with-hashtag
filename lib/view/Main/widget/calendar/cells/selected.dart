import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';

import '../event_widget.dart';

class SelectedCell extends StatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const SelectedCell({Key? key, required this.day, this.events})
      : super(key: key);

  @override
  State<SelectedCell> createState() => _SelectedCellState();
}

class _SelectedCellState extends State<SelectedCell>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _opacity;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward()
          ..addListener(() {
            setState(() {});
          });

    _opacity = Tween<double>(begin: 0, end: 1).animate(_animationController);
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

            // events
            widget.events != null
                ? EventCard(
                    events: widget.events!,
                  )
                : const SizedBox(),

            const Spacer()
          ],
        ),
      ),
    );
  }
}
