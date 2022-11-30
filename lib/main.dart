import 'package:care_square_assignment/constant/themes.dart';
import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // get the brightness of the device
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: brightness));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Theme
      theme: lightTheme,
      darkTheme: darkTheme,
      //
      home: const MainView(),
    );
  }
}
