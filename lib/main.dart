import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/news_layout/controller/cubit.dart';
import 'package:group_monday_m1/core/layout/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/layout/news_layout/news_layout.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/shop_layout.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/local/cache_helper.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/state.dart';
import 'package:group_monday_m1/core/shared/themes/themes.dart';
import 'package:group_monday_m1/features/modules/counter/observer/observer.dart';
import 'package:group_monday_m1/features/modules/shop/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:group_monday_m1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  NewsDioHelper.init();
  ShopDioHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding.toString());
  token = CacheHelper.getData(key: 'token');
  bool? isDark = CacheHelper.getData(key: 'isDark');
  print(token.toString());

  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = const ShopLoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool? isDark;

  const MyApp({super.key, required this.startWidget, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopCubit()..getHomeData()..getCategoriesHome(),),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusinessData()
            ..getSportsData()
            ..getScienceData(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()
            ..changeTheme(
              fromShared: isDark,
            ),
        )
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getLightMode(),
            darkTheme: getDarkMode(),
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}
