import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/basic_scaffold.dart';
import 'widget/appbar/appbar.dart';
import 'widget/calendar/calendar.dart';
import 'widget/events/event_list.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the current brightness
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return BasicScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
        ),
        toolbarHeight: 0,
      ),
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
                  children: const [
                    //* Calendar
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: CalendarWidget()),

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
