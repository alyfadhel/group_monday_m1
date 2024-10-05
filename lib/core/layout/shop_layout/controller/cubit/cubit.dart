import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/features/modules/home/home_screen.dart';
import 'package:group_monday_m1/features/modules/shop/categories/presentation/screens/shop_categories_screen.dart';
import 'package:group_monday_m1/features/modules/shop/favorites/presentation/screens/shop_favorites_screen.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/home_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/categories_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/presentation/screens/shop_home_screen.dart';
import 'package:group_monday_m1/features/modules/shop/settings/presentation/screens/shop_settings_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    const ShopHomeScreen(),
    const ShopCategoriesScreen(),
    const ShopFavoritesScreen(),
    const ShopSettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];
  int currentIndex = 0;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopGetHomeLoadingState());
    ShopDioHelper.getData(
      url: homeEndPoint,
      token: token,
    ).then(
      (value) {
        homeModel = HomeModel.fromJson(value.data);
        print('Home is: ${value.data.toString()}');
        emit(ShopGetHomeSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetHomeErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  CategoriesModel? categoriesModel;

  void getCategoriesHome() {
    emit(ShopGetCategoriesLoadingState());
    ShopDioHelper.getData(
      url: categoriesEndPoint,
    )
        .then(
          (value) {
            categoriesModel = CategoriesModel.fromJson(value.data);
            print('Categories is : ${value.data.toString()}');
            emit(ShopGetCategoriesSuccessState());
      },
        )
        .catchError(
          (error) {
            emit(ShopGetCategoriesErrorState(error.toString()));
            print(error.toString());
      },
        );
  }
}
