import 'package:care_square_assignment/components/basic_scaffold.dart';
import 'package:care_square_assignment/provider/events_list.dart';
import 'package:care_square_assignment/view/Event/widgets/date.dart';
import 'package:care_square_assignment/view/Event/widgets/memo.dart';
import 'package:care_square_assignment/view/Event/widgets/tags.dart';
import 'package:care_square_assignment/view/Event/widgets/title.dart';
import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/account.dart';
import '../../model/alarm._enum.dart';
import '../../model/event_model.dart';
import '../../model/repeat_enum.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final CalendarEventModel event;
  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  //
  String? title;
  DateTime? startDate, endDate;
  bool? allDay;
  Repeat? repeat;
  Account? account;
  Set<Alarm>? alarmList;
  String? location, url, memo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get the brightness of the device

    return BasicScaffold(
      //* 저장 버튼
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          //
          // create a new CalendarEventModel instance
          final CalendarEventModel event = CalendarEventModel(
            // id: widget.event.id,
            title: title ?? widget.event.title,
            description: widget.event.description,
            startTime: startDate ?? widget.event.startTime,
            endTime: endDate ?? widget.event.endTime,
            // account: account ?? widget.event.account,
            // repeat: repeat ?? widget.event.repeat,
            // alarm: alarmList ?? widget.event.alarm,
            allDay: allDay ?? widget.event.allDay,
            memo: memo ?? widget.event.memo,
          );

          // CalendarEventModel event = CalendarEventModel(
          //   title: title ?? widget.event.title,
          //   startTime: startDate ?? widget.event.startTime,
          //   allDay: allDay ?? widget.event.allDay,
          //   repeat: repeat ?? widget.event.repeat,
          //   account: account ?? widget.event.account,
          //   alarm: alarmList ?? widget.event.alarm,
          //   location: location ?? widget.event.location,
          //   url: url ?? widget.event.url,
          //   memo: memo ?? widget.event.memo,
          // );

          //* 이벤트 업데이트
          ref.watch(eventListProvider.notifier).updateEvent(widget.event, event);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.check,
          // color: brightness == Brightness.light
          //     ? AppColor.selectedCellTextLight
          //     : AppColor.selectedCellTextDark,
        ),
      ),

      //
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    EventsNotifier eventsNotifier = ref.watch(eventListProvider.notifier);
                    // 삭제 버튼
                    return IconButton(
                      // alert dialog 띄우기
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
                //* 이벤트 삭제
                Consumer(
                  builder: (context, ref, child) {
                    EventsNotifier eventsNotifier = ref.watch(eventListProvider.notifier);
                    // 삭제 버튼
                    return IconButton(
                      // alert dialog 띄우기
                      onPressed: () => _showAlertDialog(context, eventsNotifier, widget.event),
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ],
            ),

            //* 제목
            TitleWidget(
              event: widget.event,

              // 제목 콜백
              getTitle: (title) => setState(() {
                this.title = title;
              }),
            ),

            const SizedBox(
              height: 10,
            ),

            //* 시간
            TimePick(
              startDate: widget.event.startTime,
              endDate: widget.event.endTime,
              allDay: widget.event.allDay,

              // 시간 지정 콜백
              getDate: (startDate, allDay) => setState(() {
                // 받은 데이터로 업데이트
                this.startDate = startDate;
                // endDate = endDate;
                this.allDay = allDay;
              }),
            ),

            //* 반복
            // RepeatWidget(
            //   repeat: widget.event.repeat,
            //   getRepeat: (repeat) => setState(() {
            //     this.repeat = repeat;
            //   }),
            // ),

            //
            // const SizedBox(
            //   height: 30,
            // ),

            // //* 계정
            // AccountWidget(
            //   account: widget.event.account,
            // ),

            // //
            // const SizedBox(
            //   height: 15,
            // ),

            // //* 알림
            // AlarmWidget(
            //   alarmList: widget.event.alarm,
            //   getAlarmList: (alarmList) => setState(() {
            //     this.alarmList = alarmList;
            //   }),
            // ),

            // //
            // const SizedBox(
            //   height: 30,
            // ),

            // //* Location
            // LocationWidget(
            //   location: widget.event.location,
            //   getLocation: (location) => setState(() {
            //     this.location = location;
            //   }),
            // ),

            // //* url
            // UrlWidget(
            //   url: widget.event.url,
            //   getUrl: (url) => setState(() {
            //     this.url = url;
            //   }),
            // ),
            //
            const SizedBox(
              height: 10,
            ),

            Tags(tagList: widget.event.tags),
            //
            const SizedBox(
              height: 10,
            ),

            //* Memo
            MemoWidget(
              memo: widget.event.memo,
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
_showAlertDialog(BuildContext context, EventsNotifier eventsNotifier, CalendarEventModel event) {
  //* Ok 버튼
  Widget okButton = ElevatedButton(
    onPressed: () {
      //* 이벤트 삭제
      eventsNotifier.removeEvent(event);

      //
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainView(),
        ),
      );
    },
    child: const Text('삭제'),
  );

  //* 취소 버튼
  Widget cancelButton = ElevatedButton(
    onPressed: () => Navigator.of(context).pop(),
    child: const Text('취소'),
  );

  //* alert dialog 생성
  AlertDialog alertDialog =
      AlertDialog(content: const Text('정말 삭제 할까요?'), actions: [cancelButton, okButton]);

  //* alertDialog 호출
  showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
