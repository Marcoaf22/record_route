import 'package:flutter/material.dart';

final ThemeData appThemeDataLight = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 21, 111, 172),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 35, 185, 231),
    onSecondary: Colors.green,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.greenAccent,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.yellow,
  backgroundColor: Colors.black,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.purple,
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 156, 236, 197),
    onSecondary: Colors.green,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.greenAccent,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.blue),
  ),
);
