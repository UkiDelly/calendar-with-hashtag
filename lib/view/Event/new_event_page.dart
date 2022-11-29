import 'package:care_square_assignment/data/accounts.dart';
import 'package:care_square_assignment/model/account.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/model/repeat_enum.dart';
import 'package:care_square_assignment/provider/dates.dart';
import 'package:care_square_assignment/provider/events_list.dart';
import 'package:care_square_assignment/view/Event/widgets/memo.dart';
import 'package:care_square_assignment/view/Event/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/alarm._enum.dart';
import 'widgets/accounts.dart';
import 'widgets/alarm.dart';
import 'widgets/date.dart';
import 'widgets/location.dart';
import 'widgets/repeat.dart';
import 'widgets/url.dart';

class AddNewEventPage extends ConsumerStatefulWidget {
  final DateTime date;
  const AddNewEventPage({Key? key, required this.date}) : super(key: key);

  @override
  ConsumerState<AddNewEventPage> createState() => _AddNewEventPageState();
}

class _AddNewEventPageState extends ConsumerState<AddNewEventPage> {
  String? memo, location, url;
  late String title;

  late DateTime startDate, endDate;

  bool allDay = false;

  // the default account is 개인
  Account account = accounts[0];

  // default is no repeat
  Repeat repeat = Repeat.none;

  // default is no alaem
  Set<Alarm> alarm = {};

  @override
  void initState() {
    super.initState();
    startDate = DateTime(widget.date.year, widget.date.month, widget.date.day, 0, 0);
    endDate = DateTime(widget.date.year, widget.date.month, widget.date.day, 23, 59);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            // create event instance
            CalendarEvent event = CalendarEvent(
                title: title,
                startTime: startDate,
                // endTime: endDate,
                allDay: allDay,
                repeat: repeat,
                account: account,
                alarm: alarm,
                memo: memo);

            // add to the events list
            ref.watch(eventListProvider.notifier).addEvent = event;

            Navigator.of(context).pop();
          },
          child: const Icon(Icons.check),
        ),

        //
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
            TitleWidget(
              getTitle: (title) {
                setState(() {
                  this.title = title;
                });
              },
            ),
            //titleWidget(),

            //* Time
            Consumer(
              builder: (ctx, ref, child) {
                DateTime day = ref.watch(selectedDateProvider);
                return TimePick(
                  startDate: DateTime(day.year, day.month, day.day, 0, 0),
                  // endDate: DateTime(day.year, day.month, day.day, 23, 59),
                  allDay: allDay,
                  getDate: (startDate, allDay) => setState(() {
                    this.startDate = startDate;
                    // this.endDate = endDate;
                    this.allDay = allDay;
                  }),
                );
              },
            ),

            //* Repeat
            RepeatWidget(
              repeat: repeat,
              getRepeat: (repeat) => setState(() {
                this.repeat = repeat;
              }),
            ),

            //
            const SizedBox(
              height: 30,
            ),

            //* Account⌚️
            AccountWidget(
              account: account,
            ),

            //
            const SizedBox(
              height: 15,
            ),

            //* Alarm before
            AlarmWidget(
              alarmList: alarm,
              getAlarmList: (alarmList) => setState(() {
                alarm = alarmList;
              }),
            ),

            //
            const SizedBox(
              height: 30,
            ),

            //* Location
            LocationWidget(
              location: location,
              getLocation: (location) => setState(() {
                this.location = location;
              }),
            ),

            //* url
            UrlWidget(
              url: url,
              getUrl: (url) => setState(() {
                this.url = url;
              }),
            ),

            //
            const SizedBox(
              height: 10,
            ),

            //* Memo
            MemoWidget(
              memo: memo,
              getMemo: (memo) => setState(() {
                this.memo = memo;
              }),
            )
          ]),
        ));
  }
}
