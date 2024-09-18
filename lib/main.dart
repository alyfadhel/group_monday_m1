import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/features/modules/bmi/bmi_calculator.dart';
import 'package:group_monday_m1/core/shared/themes/themes.dart';
import 'package:group_monday_m1/features/modules/login/login_screen.dart';
import 'package:group_monday_m1/features/modules/review.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: getLightMode(),
      // darkTheme: getDarkMode(),
      // themeMode: ThemeMode.dark,
      home: Review(),
    );
  }
}
