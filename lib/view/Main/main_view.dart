import 'package:flutter/material.dart';

import '../../components/basic_scaffold.dart';
import 'widget/appbar/appbar.dart';
import 'widget/calendar/calendar.dart';
import 'widget/events/event_list.dart';

final eventListKey = GlobalKey<State>();

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the current brightness

    return BasicScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* App bar
              const CalendarAppBar(),

              const SizedBox(
                height: 10,
              ),

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Calendar
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CalendarWidget(),
                    ),

                    //
                    const SizedBox(
                      height: 20,
                    ),

                    //* Event List
                    EventList(
                      key: eventListKey,
                    )
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
