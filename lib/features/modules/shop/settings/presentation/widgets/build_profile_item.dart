import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/network/local/cache_helper.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/widgets/my_button.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';
import 'package:group_monday_m1/features/modules/login/login_screen.dart';
import 'package:group_monday_m1/features/modules/shop/settings/data/model/profile_model.dart';
import 'package:group_monday_m1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';

class BuildProfileItem extends StatelessWidget {
  final ProfileDataModel model;

  const BuildProfileItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        var cubit = ShopCubit.get(context);
        cubit.nameController.text = model.name;
        cubit.emailController.text = model.email;
        cubit.phoneController.text = model.phone;
        return Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: cubit.nameController,
                    type: TextInputType.text,
                    label: 'name',
                    prefix: Icons.person,
                    validator: (value) {},
                    radius: 15.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: cubit.emailController,
                    type: TextInputType.emailAddress,
                    label: 'email',
                    prefix: Icons.email_outlined,
                    validator: (value) {},
                    radius: 15.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: cubit.phoneController,
                    type: TextInputType.phone,
                    label: 'phone',
                    prefix: Icons.phone_android,
                    validator: (value) {},
                    radius: 15.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyButton(
                    onPressed: () {
                      cubit.updateUserData(
                        name: cubit.nameController.text,
                        email: cubit.emailController.text,
                        phone: cubit.phoneController.text,
                      );
                    },
                    text: 'Update',
                    background: ThemeCubit.get(context).isDark
                        ? Colors.blue
                        : Colors.deepOrange,
                    radius: 15.0,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyButton(
                    onPressed: () {
                      CacheHelper.removeData('token').then(
                        (value) {
                          if(context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShopLoginScreen(),
                              ),
                            );
                          }
                        },
                      );
                    },
                    text: 'LogOut',
                    background: ThemeCubit.get(context).isDark
                        ? Colors.blue
                        : Colors.deepOrange,
                    radius: 15.0,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
