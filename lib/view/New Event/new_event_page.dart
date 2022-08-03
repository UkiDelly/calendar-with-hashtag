import 'package:care_square_assignment/view/New%20Event/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/dates.dart';
import 'widgets/date.dart';
import 'widgets/repeat.dart';

class AddNewEventPage extends StatelessWidget {
  const AddNewEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //
        //* Add to Template
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: const Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {}),
        ),

        //* Title
        const NewEventTitle(),

        //* Time
        Consumer(
          builder: (ctx, ref, child) {
            DateTime day = ref.watch(selectedDateProvider);
            return TimePick(day: day);
          },
        ),

        //* Repeat
        const RepeatWidget()

        //* Account

        //* Alarm befor

        //* Location

        //* url

        //* Memo],
      ]),
    ));
  }
}
