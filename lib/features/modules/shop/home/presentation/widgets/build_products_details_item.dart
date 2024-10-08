import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/products_details_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildProductsDetailsItem extends StatelessWidget {
  final ProductsDetailsDataModel model;

  const BuildProductsDetailsItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CarouselSlider(
                    items: model.images
                        .map(
                          (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.fill,
                              imageUrl: e,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error_outline,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        ShopCubit.get(context).changeSmoothIndicator(index);
                      },
                    )),
                AnimatedSmoothIndicator(
                  activeIndex: ShopCubit.get(context).current,
                  count: model.images.length,
                  effect: const JumpingDotEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    jumpScale: .7,
                    verticalOffset: 20,
                    activeDotColor: Colors.red,
                    dotColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  model.price.round().toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                if (model.discount != 0)
                  Text(
                    model.oldPrice.round().toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationThickness: 2,
                        ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              model.description,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                fontSize: 18.0
                  ),
            )
          ],
        ),
      ),
    );
  }
}
