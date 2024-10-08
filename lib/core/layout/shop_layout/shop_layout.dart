import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/local/cache_helper.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/state.dart';
import 'package:group_monday_m1/features/modules/news/search/presentation/screen/search_screen.dart';
import 'package:group_monday_m1/features/modules/shop/search/presentation/screens/shop_search_screen.dart';
import 'package:group_monday_m1/main.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  ThemeCubit.get(context).changeTheme();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeLanguage();
                  CacheHelper.setData(key: 'language', value: language).then(
                    (value) {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(
                                startWidget: const ShopLayout(),
                                isDark: ThemeCubit.get(context).isDark),
                          ),
                        );
                      }
                    },
                  );
                },
                icon: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      language.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopSearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search_sharp,
                  size: 30.0,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
