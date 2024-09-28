
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightMode()
{
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
          color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30.0
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
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
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
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
        size: 30.0
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.deepOrange,
    ),
  );
}