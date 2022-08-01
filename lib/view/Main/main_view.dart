import 'package:flutter/cupertino.dart';

import 'widget/appbar/appbar.dart';
import 'widget/calendar/calendar.dart';
import 'widget/events/event_list.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // App bar
            CalendarAppBar(),

            //
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* Calendar
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CalendarWidget(
                        key: calendarKey,
                      )),

                  //
                  const SizedBox(
                    height: 20,
                  ),

                  //* Event List
                  const EventList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
