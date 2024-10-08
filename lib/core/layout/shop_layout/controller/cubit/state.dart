import 'package:group_monday_m1/features/modules/shop/home/data/model/change_favorites_model.dart';
import 'package:group_monday_m1/features/modules/shop/settings/data/model/update_profile_model.dart';

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

class ShopChangeLanguageState extends ShopStates{}

class ShopGetProductDetailsLoadingState extends ShopStates{}
class ShopGetProductDetailsSuccessState extends ShopStates{}
class ShopGetProductDetailsErrorState extends ShopStates{
  final String error;

  ShopGetProductDetailsErrorState(this.error);
}

class ShopChangeSmoothIndicatorState extends ShopStates{}

class ShopGetProfileLoadingState extends ShopStates{}
class ShopGetProfileSuccessState extends ShopStates{}
class ShopGetProfileErrorState extends ShopStates{
  final String error;

  ShopGetProfileErrorState(this.error);
}

class ShopGetUpdateProfileLoadingState extends ShopStates{}
class ShopGetUpdateProfileSuccessState extends ShopStates{
  final UpdateProfileModel updateProfileModel;

  ShopGetUpdateProfileSuccessState(this.updateProfileModel);
}
class ShopGetUpdateProfileErrorState extends ShopStates{
  final String error;

  ShopGetUpdateProfileErrorState(this.error);
}

class ShopGetSearchLoadingState extends ShopStates{}
class ShopGetSearchSuccessState extends ShopStates{}
class ShopGetSearchErrorState extends ShopStates{
  final String error;

  ShopGetSearchErrorState(this.error);
}