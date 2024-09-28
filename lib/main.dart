import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/news_layout/controller/cubit.dart';
import 'package:group_monday_m1/core/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/news_layout/news_layout.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/features/modules/counter/observer/observer.dart';



void main() {
  DioHelper.init();
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
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..getBusinessData()..getScienceData()..getSportsData(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {

        },
        builder: (BuildContext context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            //  theme: getLightMode(),
            // darkTheme: getDarkMode(),
            // themeMode: ThemeMode.dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
