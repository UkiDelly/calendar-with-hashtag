import 'package:care_square_assignment/data/accounts.dart';
import 'package:care_square_assignment/data/events.dart';
import 'package:care_square_assignment/model/account.dart';
import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:care_square_assignment/model/repeat_enum.dart';
import 'package:care_square_assignment/provider/dates.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../model/alarm._enum.dart';
import 'Memo/memo_page.dart';
import 'widgets/accounts.dart';
import 'widgets/alarm.dart';
import 'widgets/date.dart';
import 'widgets/location.dart';
import 'widgets/repeat.dart';
import 'widgets/url.dart';

class AddNewEventPage extends StatefulWidget {
  final DateTime date;
  const AddNewEventPage({Key? key, required this.date}) : super(key: key);

  @override
  State<AddNewEventPage> createState() => AddNewEventPageState();
}

class AddNewEventPageState extends State<AddNewEventPage> {
  String? memo;
  late String title, location, url;

  late DateTime startDate, endDate;

  bool allDay = false;

  // the default account is 개인
  Account account = accounts[0];

  // default is no repeat
  Repeat repeat = Repeat.none;

  // default is no alaem
  Set<Alarm> alarm = {};

  //
  final TextEditingController _titleController = TextEditingController();

  late CalendarEvent event;

  @override
  void initState() {
    super.initState();
    startDate =
        DateTime(widget.date.year, widget.date.month, widget.date.day, 0, 0);
    endDate =
        DateTime(widget.date.year, widget.date.month, widget.date.day, 23, 59);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: CupertinoTheme.of(context).primaryColor,
          onPressed: () {
            // create event instance
            event = CalendarEvent(
                title: title,
                startTime: startDate,
                endTime: endDate,
                allDay: allDay,
                account: account,
                alarm: alarm);

            // add to the events list
            events.add(event);

            Navigator.of(context).pop();
          },
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
            titleWidget(),

            //* Time
            Consumer(
              builder: (ctx, ref, child) {
                DateTime day = ref.watch(selectedDateProvider);
                return TimePick(
                  day: day,
                  getDate: (startDate, endDate, allDay) => setState(() {
                    this.startDate = startDate;
                    this.endDate = endDate;
                    this.allDay = allDay;
                  }),
                );
              },
            ),

            //* Repeat
            const RepeatWidget(),

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
            // MemoWidget(
            //   getMemo: (memo) => setState(() => this.memo = memo),
            // ),

            memoWidget()
          ]),
        ));
  }

  Widget titleWidget() {
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
                  color: account.color,
                  borderRadius: BorderRadius.circular(25)),
            ),

            //
            decoration: const BoxDecoration(),
            style: const TextStyle(fontSize: 50),
            placeholder: "제목",

            // save the title when done typing
            onChanged: (value) => setState(() {
              title = value;
            }),
          ))
        ],
      ),
    );
  }

  Widget datePickerWidget() {
    return const SizedBox();
  }

  Widget locationWidget() {
    return const SizedBox();
  }

  Widget urlWidget() {
    return const SizedBox();
  }

  Widget memoWidget() {
    if (memo != null && memo != "") {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          decoration: BoxDecoration(
              color: const Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Memo text
              Text(memo!),

              // edit Button
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "편집",
                          style: TextStyle(fontSize: 12.5),
                        )),
                    onPressed: () => showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => MemoInputPage(
                              memo: memo,
                            )).then((memo) => setState(
                          () {
                            // update the memo
                            this.memo = memo;
                          },
                        ))),
              )
            ],
          ),
        ),
      );
    } else {
      return Row(
        children: [
          const Icon(CupertinoIcons.doc_text),
          //
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: CupertinoTextField(
            //
            maxLines: null,
            readOnly: true,
            decoration: const BoxDecoration(color: Colors.transparent),
            onTap: () => showCupertinoModalBottomSheet(
              context: context,

              //* show the memo input page
              builder: (context) => MemoInputPage(),
            ).then((value) => setState(
                  () {
                    // update the memo
                    memo = value;
                  },
                )),

            //
            placeholder: "메모",
          )),
        ],
      );
    }
  }
}
