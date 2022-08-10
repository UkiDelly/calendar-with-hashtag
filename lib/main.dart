import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // only light mode
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Theme
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: textTheme,
          primaryColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.black)),

      //
      home: const MainView(),
    );
  }
}

// theme data
// text theme
final TextTheme textTheme = const TextTheme().copyWith(
    titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    titleMedium: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
    titleSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    bodySmall: const TextStyle(fontSize: 17)
    // headline2: const TextStyle(fontSize: 20)
    );
