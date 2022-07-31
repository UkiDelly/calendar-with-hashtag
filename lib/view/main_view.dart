import 'package:care_square_assignment/view/widget/calendar/calendar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/dates.dart';
import 'widget/back_to_now.dart';
import 'widget/events/event_list.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 75,

        //* month
        leading: Consumer(
          builder: (ctx, ref, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
              child: Text(
                ref.watch(currentMonthProvider).toString(),
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff313131)),
              ),
            );
          },
        ),
        leadingWidth: 100,

        //* buttons
        actions: [
          //* go back to today if the calendar is not on the current month
          Consumer(
            builder: (ctx, ref, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: ref.watch(currentMonthProvider) != DateTime.now().month
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: BackToNow(),
                      )
                    : null,
              );
            },
          ),

          //* search button
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Color(0xff313131),
                size: 20,
              )),

          //* calendar accounts button
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month,
                color: Color(0xff313131),
                size: 20,
              )),

          //* setting button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Color(0xff313131),
              size: 20,
            ),
          )
        ],
      ),

      //
      body: SafeArea(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
