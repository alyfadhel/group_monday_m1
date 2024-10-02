import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/features/modules/shop/users/data/model/login_model.dart';
import 'package:group_monday_m1/features/modules/shop/users/presentation/controller/cubit/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangeVisibilityPasswordState());
  }

  LoginModel? loginModel;

  void getDataUser({
    required String email,
    required String password,
  }) {
    emit(LoginGetDataLoadingState());

    ShopDioHelper.postData(
      url: loginEndPoint,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        loginModel = LoginModel.fromJson(value.data);
        print(value.data.toString());
        emit(LoginGetDataSuccessState(loginModel!));
      },
    ).catchError(
      (error) {
        emit(LoginGetDataErrorState(error.toString()));
        print(error.toString());
      },
    );
  }
}
