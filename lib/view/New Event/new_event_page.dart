import 'package:care_square_assignment/view/New%20Event/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/dates.dart';
import 'widgets/accounts.dart';
import 'widgets/alarm.dart';
import 'widgets/date.dart';
import 'widgets/location.dart';
import 'widgets/memo.dart';
import 'widgets/repeat.dart';
import 'widgets/url.dart';

class AddNewEventPage extends StatelessWidget {
  const AddNewEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: CupertinoTheme.of(context).primaryColor,
          onPressed: () {},
          child: const Icon(Icons.check),
        ),

        //
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            const RepeatWidget(),

            //
            const SizedBox(
              height: 30,
            ),

            //* Account
            const AccountWidget(),

            //
            const SizedBox(
              height: 15,
            ),

            //* Alarm before
            const AlarmWidget(),

            //
            const SizedBox(
              height: 30,
            ),

            //* Location
            const LocationWidget(),

            //* url
            const UrlWidget(),

            //
            const SizedBox(
              height: 10,
            ),

            //* Memo
            const MemoWidget(),
          ]),
        ));
  }
}
