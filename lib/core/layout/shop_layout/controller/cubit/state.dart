import 'package:group_monday_m1/features/modules/shop/home/data/model/change_favorites_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopGetHomeLoadingState extends ShopStates{}
class ShopGetHomeSuccessState extends ShopStates{}
class ShopGetHomeErrorState extends ShopStates{
  final String error;

  ShopGetHomeErrorState(this.error);
}

class ShopGetCategoriesLoadingState extends ShopStates{}
class ShopGetCategoriesSuccessState extends ShopStates{}
class ShopGetCategoriesErrorState extends ShopStates{
  final String error;

  ShopGetCategoriesErrorState(this.error);
}

class ShopGetChangeFavoritesState extends ShopStates{}
class ShopGetChangeFavoritesSuccessState extends ShopStates{
  final ChangeFavoriteModel changeFavoriteModel;

  ShopGetChangeFavoritesSuccessState(this.changeFavoriteModel);
}
class ShopGetChangeFavoritesErrorState extends ShopStates{
  final String error;

  ShopGetChangeFavoritesErrorState(this.error);
}

class ShopGetFavoritesLoadingState extends ShopStates{}
class ShopGetFavoritesSuccessState extends ShopStates{}
class ShopGetFavoritesErrorState extends ShopStates{
  final String error;

  ShopGetFavoritesErrorState(this.error);
}
