import 'package:care_square_assignment/provider/events_list.dart';
import 'package:care_square_assignment/view/Event/widgets/date.dart';
import 'package:care_square_assignment/view/Event/widgets/memo.dart';
import 'package:care_square_assignment/view/Event/widgets/repeat.dart';
import 'package:care_square_assignment/view/Event/widgets/title.dart';
import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/account.dart';
import '../../model/alarm._enum.dart';
import '../../model/calendar_event.dart';
import '../../model/repeat_enum.dart';
import 'widgets/accounts.dart';
import 'widgets/alarm.dart';
import 'widgets/location.dart';
import 'widgets/url.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final CalendarEvent event;
  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
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
    startDate = widget.event.startTime;
    endDate = widget.event.endTime;
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
          onPressed: () {
            // chagne the event using copyWith
            CalendarEvent event = CalendarEvent(
                title: title,
                startTime: startDate,
                endTime: endDate,
                allDay: allDay,
                repeat: repeat,
                account: account,
                alarm: alarmList,
                location: location,
                url: url,
                memo: memo);

            // update the event
            ref
                .watch(eventListProvider.notifier)
                .updateEvent(widget.event, event);
          },
          child: const Icon(Icons.check)),

      //
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
        child: Column(
          children: [
            // delete the event
            Align(
                alignment: Alignment.centerRight,
                child: Consumer(
                  builder: (context, ref, child) {
                    EventsNotifier eventsNotifier =
                        ref.watch(eventListProvider.notifier);
                    // delete button
                    return IconButton(

                        // show the alert dialog
                        onPressed: () => _showAlertDialog(
                            context, eventsNotifier, widget.event),
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ));
                  },
                )),

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

//
_showAlertDialog(
    BuildContext context, EventsNotifier eventsNotifier, CalendarEvent event) {
  //* Ok button
  Widget okButton = ElevatedButton(
      onPressed: () {
        //* remove the event
        eventsNotifier.removeEvent(event);

        //
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainView(),
        ));
      },
      child: const Text("삭제"));

  //* Canecel button
  Widget cancelButton = ElevatedButton(
    onPressed: () => Navigator.of(context).pop(),
    child: const Text("취소"),
  );

  //* Create alert dialog
  AlertDialog alertDialog = AlertDialog(
      content: const Text("정말 삭제 할까요?"), actions: [cancelButton, okButton]);

  //* show alert dialog
  showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
