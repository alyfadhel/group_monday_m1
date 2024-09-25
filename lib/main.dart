import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/todo_app.dart';
import 'package:group_monday_m1/core/shared/themes/themes.dart';
import 'package:group_monday_m1/features/modules/bmi/bmi_calculator.dart';
import 'package:group_monday_m1/features/modules/counter/counter_screen.dart';
import 'package:group_monday_m1/features/modules/counter/observer/observer.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: getLightMode(),
      // darkTheme: getDarkMode(),
      // themeMode: ThemeMode.dark,
      home: TodoApp(),
    );
  }
}
