import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/home_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/categories_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/presentation/widgets/build_home_categories_item.dart';
import 'package:group_monday_m1/features/modules/shop/home/presentation/widgets/build_product_item.dart';
import 'package:shimmer/shimmer.dart';

class BuildItem extends StatelessWidget {
  final HomeModel homeModel;

  const BuildItem({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel.data.banners
                .map(
                  (e) => ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: e.image,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                        size: 100.0,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 150.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => BuildHomeCategoriesItem(
                        model: ShopCubit.get(context)
                            .categoriesModel!
                            .data
                            .data[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: ShopCubit.get(context)
                        .categoriesModel!
                        .data
                        .data
                        .length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'New Products',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              homeModel.data.products.length,
              (index) => BuildProductItem(
               model: homeModel.data.products[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


