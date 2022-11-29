import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black),
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
  textTheme: const TextTheme(
    // set 2021 text theme
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
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
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 17,
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
      fontSize: 17,
    ),
  ),
  // colorScheme: ColorScheme.fromSwatch().copyWith(primaryColor = Colors.white),
);

// dark theme
ThemeData darkTheme = ThemeData(
    // colors for dark theme
    primaryColor: const Color(0xff121212),
    scaffoldBackgroundColor: const Color(0xff121212),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      color: const Color(0xff121212),
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
    textTheme: const TextTheme(
      // opposite of light text theme
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
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
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 17,
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
        fontSize: 17,
      ),
    ));

class AppColor {
  const AppColor._();

  // color for Default cell light theme
  static const Color defaultCellLight = Colors.white;
  // color for Default cell dark theme
  static const Color defaultCellDark = Color(0xff121212);

  // color for selected cell light theme
  static const Color selectedCellLight = Color(0xff121212);
  static const Color selectedCellTextLight = Colors.white;

  // color for selected cell dark theme
  static const Color selectedCellDark = Colors.white;
  static const Color selectedCellTextDark = Colors.black;

  static const Color defaultCellLightText = Colors.black;
  static const Color defaultCellDarkText = Color(0xffe0e0e0);
  static const Color holidayColor = Colors.red;
}
