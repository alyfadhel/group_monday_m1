import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/categories/presentation/widgets/build_categories_item.dart';
import 'package:shimmer/shimmer.dart';

class ShopCategoriesScreen extends StatelessWidget {
  const ShopCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildCategoriesItem(
            model: cubit.categoriesModel!.data.data[index],
          ),
          itemCount: cubit.categoriesModel!.data.data.length,
        );
      },
    );
  }
}
