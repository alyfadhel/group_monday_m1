import 'package:flutter/material.dart';
import 'package:group_monday_m1/counter_screen.dart';
import 'package:group_monday_m1/home_screen.dart';
import 'package:group_monday_m1/login_screen.dart';
import 'package:group_monday_m1/messenger_screen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: const CounterScreen(),
    );
  }

}
