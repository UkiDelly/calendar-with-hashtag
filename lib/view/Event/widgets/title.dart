import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/accounts.dart';

class TitleWidget extends StatefulWidget {
  final CalendarEvent? event;
  final Function(String) getTitle;
  const TitleWidget({Key? key, this.event, required this.getTitle})
      : super(key: key);

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  //
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // it is editing the events
    if (widget.event != null) {
      _titleController.text = widget.event!.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* text field
          Expanded(
              child: CupertinoTextField(
            controller: _titleController,
            padding: const EdgeInsets.all(10),

            // indicator
            prefix: Container(
              height: 40,
              width: 5,
              decoration: BoxDecoration(
                  // if the event parameter is null, show the 개인's color
                  // but if not null, show the color of the event's
                  color: widget.event != null
                      ? widget.event!.account.color
                      : accounts[0].color,
                  borderRadius: BorderRadius.circular(25)),
            ),

            //
            decoration: const BoxDecoration(),
            style: const TextStyle(fontSize: 50),
            placeholder: "제목",
            cursorColor: Theme.of(context).primaryColor,

            // save the title when done typing
            onChanged: (value) => widget.getTitle(value),
          ))
        ],
      ),
    );
  }
}
