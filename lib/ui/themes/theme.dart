import 'package:flutter/material.dart';

ThemeData themeData() {
  const primaryColor = Colors.purple;
  const segundaryColor = Colors.yellowAccent;

  const appBarTheme = AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: segundaryColor,
      fontFamily: 'OpenSans',
    ),
    iconTheme: IconThemeData(color: segundaryColor),
  );

  const floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: segundaryColor,
  );

  const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );

  return ThemeData(
    appBarTheme: appBarTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,
    fontFamily: 'Quicksand',
    textTheme: textTheme,
  );
}
