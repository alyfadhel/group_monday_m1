import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';
import 'package:group_monday_m1/core/shared/widgets/toast_state.dart';
import 'package:group_monday_m1/features/modules/shop/settings/presentation/widgets/build_profile_item.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopGetUpdateProfileSuccessState) {
          if (state.updateProfileModel.status) {
            showToastState(
              msg: state.updateProfileModel.message,
              state: ToastState.success,
            );
          }else{
            showToastState(
              msg: state.updateProfileModel.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.profileModel != null,
          builder: (context) => BuildProfileItem(
            model: cubit.profileModel!.data!,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
