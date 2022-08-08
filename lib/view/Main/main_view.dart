import 'package:flutter/material.dart';

import 'widget/appbar/appbar.dart';
import 'widget/calendar/calendar.dart';
import 'widget/events/event_list.dart';

final mainPageKey = GlobalKey<State>();

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App bar
              const CalendarAppBar(),

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
      ),
    );
  }
}
