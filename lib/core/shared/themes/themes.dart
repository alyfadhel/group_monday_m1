
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightMode()
{
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 100.0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 50.0,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      ),
    ),
  );
}

ThemeData getDarkMode()
{
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.pink,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 100.0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 50.0,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      ),
    ),
  );
}