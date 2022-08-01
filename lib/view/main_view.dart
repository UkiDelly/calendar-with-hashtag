import 'package:care_square_assignment/view/widget/appbar/appbar.dart';
import 'package:care_square_assignment/view/widget/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'widget/events/event_list.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      overlayStyle: SystemUiOverlayStyle.dark,
      transitionBackgroundColor: Colors.white,
      //
      body: SafeArea(
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
