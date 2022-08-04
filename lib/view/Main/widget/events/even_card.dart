import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCardTile extends StatefulWidget {
  final CalendarEvent event;
  const EventCardTile({Key? key, required this.event}) : super(key: key);

  @override
  State<EventCardTile> createState() => _EventCardTileState();
}

class _EventCardTileState extends State<EventCardTile>
    with TickerProviderStateMixin {
  //
  late Animation<double> opcaity;
  late AnimationController animationController;

  //
  TextStyle titleTextStyle =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w700);
  TextStyle subtitleTextStyle = const TextStyle();

  @override
  void initState() {
    // Animation
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      })
      ..forward();

    opcaity = Tween<double>(begin: 0, end: 1).animate(animationController);

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

      //* go to event detal
      onPressed: () {},
      child: AnimatedOpacity(
        opacity: opcaity.value,
        duration: const Duration(milliseconds: 500),
        child: Card(
          color: const Color(0xfff4f4f4),
          elevation: 0,

          //
          child: SizedBox(
              child: Row(
            children: [
              //
              //* Date
              SizedBox(
                width: 100,
                child: Column(
                  children: const [],
                ),
              ),

              // Divider
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(25)),
              ),

              Container(
                padding: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* title
                    Text(
                      widget.event.title,
                      style: titleTextStyle,
                    ),

                    //* description
                    Text(widget.event.description)
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
