import 'package:care_square_assignment/provider/current_month.dart';
import 'package:care_square_assignment/view/widget/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/back_to_now.dart';

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

        // theme

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
          // go back to today if the calendar is not on the current month
          Consumer(
            builder: (ctx, ref, child) {
              return SizedBox(
                child: ref.watch(currentMonthProvider) != DateTime.now().month
                    ? const BackToNow()
                    : null,
              );
            },
          ),

          // search button
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Color(0xff313131),
              )),

          // calendar accounts button
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month, color: Color(0xff313131))),

          // setting button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Color(0xff313131)),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              //
              SizedBox(child: CalendarWidget()),

              //
            ],
          ),
        ),
      ),
    );
  }
}
