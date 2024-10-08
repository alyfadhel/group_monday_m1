import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_monday_m1/core/layout/shop_layout/shop_layout.dart';
import 'package:group_monday_m1/core/shared/const/const.dart';
import 'package:group_monday_m1/core/shared/network/local/cache_helper.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/widgets/my_button.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_button.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';
import 'package:group_monday_m1/core/shared/widgets/toast_state.dart';
import 'package:group_monday_m1/features/modules/shop/users/presentation/controller/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/users/presentation/controller/cubit/state.dart';
import 'package:group_monday_m1/main.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginGetDataSuccessState) {
            if (state.loginModel.status) {
              showToastState(
                msg: state.loginModel.message,
                state: ToastState.success,
              );
              CacheHelper.setData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then(
                (value) {
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(
                          startWidget: const ShopLayout(),
                          isDark: ThemeCubit.get(context).isDark,
                        ),
                      ),
                    );
                  }
                },
              );
              token = state.loginModel.data!.token;
            } else {
              showToastState(
                msg: state.loginModel.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Login to browse hot offer',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyTextFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          isUpperCase: false,
                          prefix: Icons.email,
                          radius: 10.0,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyTextFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock,
                          radius: 10.0,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must be not empty';
                            }
                            return null;
                          },
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginGetDataLoadingState,
                          builder: (context) => MyButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getDataUser(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            radius: 10.0,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const SizedBox(
                          height: 120.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?!',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            MyTextButton(
                              onPressed: () {},
                              text: 'Register',
                              isUpperCase: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
