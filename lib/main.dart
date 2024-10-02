import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/news_layout/controller/cubit.dart';
import 'package:group_monday_m1/core/layout/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/layout/news_layout/news_layout.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/core/shared/themes/themes.dart';
import 'package:group_monday_m1/features/modules/counter/observer/observer.dart';



void main() {
  NewsDioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusinessData()
        ..getSportsData()
        ..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getLightMode(),
            darkTheme: getDarkMode(),
            themeMode: ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
