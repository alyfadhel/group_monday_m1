import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/widgets/toast_state.dart';
import 'package:group_monday_m1/features/modules/shop/favorites/presentation/widgets/build_favorites_item.dart';
import 'package:shimmer/shimmer.dart';

class ShopFavoritesScreen extends StatelessWidget {
  const ShopFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopGetChangeFavoritesSuccessState) {
          if (state.changeFavoriteModel.status) {
            showToastState(
              msg: state.changeFavoriteModel.message,
              state: ToastState.success,
            );
          } else {
            showToastState(
              msg: state.changeFavoriteModel.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        if (cubit.favoritesModel!.data!.data.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => BuildFavoritesItem(
              model: cubit.favoritesModel!.data!.data[index].product,
            ),
            itemCount: cubit.favoritesModel!.data!.data.length,
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No favorites Yet',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                    color: Colors.grey[400]
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Icon(
                  Icons.menu,
                  color: ThemeCubit.get(context).isDark
                      ? Colors.grey[400]
                      : Colors.grey[400],
                  size: 100,

                )
              ],
            ),
          );
        }
      },
    );
  }
}
