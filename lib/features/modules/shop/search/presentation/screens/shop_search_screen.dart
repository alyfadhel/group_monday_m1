import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';
import 'package:group_monday_m1/features/modules/news/search/presentation/widgets/build_search_item.dart';
import 'package:group_monday_m1/features/modules/shop/search/presentation/widgets/build_search_item.dart';

class ShopSearchScreen extends StatelessWidget {
  const ShopSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                cubit.searchController.clear();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                MyTextFormField(
                  controller: cubit.searchController,
                  type: TextInputType.text,
                  label: 'search',
                  prefix: Icons.search_sharp,
                  validator: (value) {},
                  radius: 15.0,
                  onChanged: (text) {
                    cubit.getSearch(text: text);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ConditionalBuilder(
                      condition: cubit.searchModel != null,
                      builder: (context) => ListView.separated(
                            itemBuilder: (context, index) =>
                                BuildShopSearchItem(
                              model: cubit.searchModel!.data!.data[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10.0,
                            ),
                            itemCount: cubit.searchModel!.data!.data.length,
                          ),
                      fallback: (context) {
                        if (isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          isLoading = false;
                          return Container();
                        }
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
