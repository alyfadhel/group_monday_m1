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
