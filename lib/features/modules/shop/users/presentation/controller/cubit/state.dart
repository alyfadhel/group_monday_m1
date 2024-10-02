import 'package:group_monday_m1/features/modules/shop/users/data/model/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginChangeVisibilityPasswordState extends LoginStates{}

class LoginGetDataLoadingState extends LoginStates{}
class LoginGetDataSuccessState extends LoginStates{
  final LoginModel loginModel;

  LoginGetDataSuccessState(this.loginModel);
}
class LoginGetDataErrorState extends LoginStates{
  final String error;

  LoginGetDataErrorState(this.error);
}