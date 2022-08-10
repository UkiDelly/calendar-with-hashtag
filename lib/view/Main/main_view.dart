import 'package:flutter/material.dart';

import 'widget/appbar/appbar.dart';
import 'widget/calendar/calendar.dart';
import 'widget/events/event_list.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* App bar
              const CalendarAppBar(),

              //* Calendar
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //* Calendar
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CalendarWidget()),

                    //
                    SizedBox(
                      height: 20,
                    ),

                    //* Event List
                    EventList()
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
