import 'package:care_square_assignment/view/Event/widgets/date.dart';
import 'package:care_square_assignment/view/Event/widgets/memo.dart';
import 'package:care_square_assignment/view/Event/widgets/repeat.dart';
import 'package:care_square_assignment/view/Event/widgets/title.dart';
import 'package:flutter/material.dart';

import '../../model/account.dart';
import '../../model/alarm._enum.dart';
import '../../model/calendar_event.dart';
import '../../model/repeat_enum.dart';
import 'widgets/accounts.dart';
import 'widgets/alarm.dart';
import 'widgets/location.dart';
import 'widgets/url.dart';

class EventDetailPage extends StatefulWidget {
  final CalendarEvent event;
  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  //
  late String title;
  late DateTime startDate, endDate;
  late bool allDay;
  late Repeat repeat;
  late Account account;
  late Set<Alarm> alarmList;
  late String? location, url, memo;

  @override
  void initState() {
    super.initState();

    // set the title to the title of the event
    title = widget.event.title;
    allDay = widget.event.allDay;
    repeat = widget.event.repeat;
    account = widget.event.account;
    alarmList = widget.event.alarm;
    location = widget.event.location;
    url = widget.event.url;
    memo = widget.event.memo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Okay button
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
          child: const Icon(Icons.check)),

      //
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
        child: Column(
          children: [
            // delete the event
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  )),
            ),

            //* Title
            TitleWidget(
              event: widget.event,

              // update the title
              getTitle: (title) => setState(() {
                this.title = title;
              }),
            ),

            //* Time
            TimePick(
              startDate: widget.event.startTime,
              endDate: widget.event.endTime,
              allDay: widget.event.allDay,
              getDate: (startDate, endDate, allDay) => setState(() {
                this.startDate = startDate;
                this.endDate = endDate;
                this.allDay = allDay;
              }),
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

            //* Account
            AccountWidget(
              account: account,
            ),

            //
            const SizedBox(
              height: 15,
            ),

            //* Alarm before
            AlarmWidget(
              alarmList: alarmList,
              getAlarmList: (alarmList) => setState(() {
                this.alarmList = alarmList;
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
          ],
        ),
      ),
    );
  }
}
