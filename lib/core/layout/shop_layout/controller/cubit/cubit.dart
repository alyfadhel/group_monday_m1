import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/features/modules/home/home_screen.dart';
import 'package:group_monday_m1/features/modules/shop/categories/presentation/screens/shop_categories_screen.dart';
import 'package:group_monday_m1/features/modules/shop/favorites/data/model/favorites_model.dart';
import 'package:group_monday_m1/features/modules/shop/favorites/presentation/screens/shop_favorites_screen.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/change_favorites_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/home_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/categories_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/products_details_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/presentation/screens/shop_home_screen.dart';
import 'package:group_monday_m1/features/modules/shop/search/data/search_model.dart';
import 'package:group_monday_m1/features/modules/shop/settings/data/model/profile_model.dart';
import 'package:group_monday_m1/features/modules/shop/settings/data/model/update_profile_model.dart';
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
  int current = 0;

  void changeSmoothIndicator(index) {
    current = index;
    emit(ShopChangeSmoothIndicatorState());
  }

  void changeLanguage() {
    if (language == 'ar') {
      language = 'en';
    } else {
      language = 'ar';
    }
    emit(ShopChangeLanguageState());
  }

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopGetHomeLoadingState());
    ShopDioHelper.getData(
      url: homeEndPoint,
      token: token,
      lang: language,
    ).then(
      (value) {
        homeModel = HomeModel.fromJson(value.data);
        homeModel!.data.products.forEach(
          (element) {
            favorites.addAll(
              {
                element.id: element.inFavorites,
              },
            );
          },
        );
        print('Favorites is: ${favorites.toString()}');
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

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopGetChangeFavoritesState());
    ShopDioHelper.postData(
      url: changeFavoritesEndPoint,
      data: {
        'product_id': productId,
      },
      token: token,
      lang: language,
    ).then(
      (value) {
        changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
        if (!changeFavoriteModel!.status) {
          favorites[productId] = !favorites[productId]!;
        } else {
          getFavorites();
        }
        print('Change Favorites ${value.data.toString()}');
        emit(ShopGetChangeFavoritesSuccessState(changeFavoriteModel!));
      },
    ).catchError(
      (error) {
        emit(ShopGetChangeFavoritesErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopGetFavoritesLoadingState());
    ShopDioHelper.getData(
      url: favoritesEndPoint,
      token: token,
      lang: language,
    ).then(
      (value) {
        favoritesModel = FavoritesModel.fromJson(value.data);
        emit(ShopGetFavoritesSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetFavoritesErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  CategoriesModel? categoriesModel;

  void getCategoriesHome() {
    emit(ShopGetCategoriesLoadingState());
    ShopDioHelper.getData(
      url: categoriesEndPoint,
      lang: language,
    ).then(
      (value) {
        categoriesModel = CategoriesModel.fromJson(value.data);
        print('Categories is : ${value.data.toString()}');
        emit(ShopGetCategoriesSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetCategoriesErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  ProductsDetailsModel? productsDetailsModel;

  void getProductsDetails(int id) {
    emit(ShopGetProductDetailsLoadingState());
    ShopDioHelper.getData(
      url: productDetails(id),
      token: token,
      lang: language,
    ).then(
      (value) {
        productsDetailsModel = ProductsDetailsModel.fromJson(value.data);
        emit(ShopGetProductDetailsSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetProductDetailsErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  ProfileModel? profileModel;

  void getUserData() {
    emit(ShopGetProfileLoadingState());
    ShopDioHelper.getData(
      url: profileEndPoint,
      token: token,
      lang: language,
    ).then(
      (value) {
        profileModel = ProfileModel.fromJson(value.data);
        print('Profile is${value.data.toString()}');
        emit(ShopGetProfileSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetProfileErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  UpdateProfileModel? updateProfileModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopGetUpdateProfileLoadingState());
    ShopDioHelper.putData(
      url: updateProfileEndPoint,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
      token: token,
      lang: language,
    ).then(
      (value) {
        updateProfileModel = UpdateProfileModel.fromJson(value.data);
        getUserData();
        emit(ShopGetUpdateProfileSuccessState(updateProfileModel!));
      },
    ).catchError(
      (error) {
        emit(ShopGetUpdateProfileErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  var searchController = TextEditingController();
  SearchModel? searchModel;

  void getSearch({
    required String text,
  }) {
    emit(ShopGetSearchLoadingState());
    ShopDioHelper.postData(
      url: searchEndPoint,
      data: {
        'text': text,
      },
      token: token,
      lang: language,
    )
        .then(
          (value) {
            searchModel = SearchModel.fromJson(value.data);
            emit(ShopGetSearchSuccessState());
          },
        )
        .catchError(
          (error) {
            emit(ShopGetSearchErrorState(error.toString()));
            print(error.toString());
      },
        );
  }
}
