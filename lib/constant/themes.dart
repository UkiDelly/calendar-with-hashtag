import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  primarySwatch: createMaterialColor(Colors.black),
  scaffoldBackgroundColor: Colors.white,
  primaryIconTheme: const IconThemeData(color: Colors.black),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: const Color(0xff212529),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(),
    buttonColor: Color(0xff212529),
    textTheme: ButtonTextTheme.normal,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).headline6,
  ),
  primaryTextTheme: const TextTheme(
    // set 2021 text theme
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 12,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade200,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      // backgroundColor: const Color(0xff212529),
      padding: EdgeInsets.zero,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      splashFactory: NoSplash.splashFactory,

      // foregroundColor: Colors.white,
    ),
  ),
  splashFactory: NoSplash.splashFactory,
);

// dark theme
ThemeData darkTheme = ThemeData(
  // colors for dark theme
  primaryColor: Colors.black,
  primarySwatch: createMaterialColor(Colors.white),
  scaffoldBackgroundColor: const Color(0xff212529),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(),
    buttonColor: Color(0xff212529),
    textTheme: ButtonTextTheme.normal,
  ),
  appBarTheme: AppBarTheme(
    color: const Color(0xff212529),
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).headline6,
  ),
  primaryTextTheme: const TextTheme(
    // set 2021 text theme
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade700,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  splashFactory: NoSplash.splashFactory,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      // backgroundColor: const Color(0xff212529),
      padding: EdgeInsets.zero,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      splashFactory: NoSplash.splashFactory,
      // foregroundColor: Colors.white,
    ),
  ),
);

class AppColor {
  const AppColor._();

  // color for Default cell light theme
  static const Color defaultCellLight = Colors.white;
  // color for Default cell dark theme
  static const Color defaultCellDark = Color(0xff212529);

  // color for selected cell light theme
  static const Color selectedCellLight = Color(0xff212529);
  static const Color selectedCellTextLight = Colors.white;

  // color for selected cell dark theme
  static const Color selectedCellDark = Colors.white;
  static const Color selectedCellTextDark = Colors.black;

  static const Color defaultCellLightText = Colors.black;
  static const Color defaultCellDarkText = Color(0xffe0e0e0);
  static const Color holidayColor = Colors.red;
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
