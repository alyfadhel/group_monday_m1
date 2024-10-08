import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/home/data/model/home_model.dart';
import 'package:group_monday_m1/features/modules/shop/home/presentation/screens/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class BuildProductItem extends StatelessWidget {
  final ProductsModel model;

  const BuildProductItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              id: model.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.fill,
                      imageUrl: model.image,
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
                  if (model.discount != 0)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Text(
                          'Discount',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
            ),
            Row(
              children: [
                Text(
                  model.price.round().toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  width: 10.0,
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
                const Spacer(),
                IconButton(
                  onPressed: () {
                    ShopCubit.get(context).changeFavorites(model.id);
                  },
                  icon: CircleAvatar(
                    backgroundColor:
                        ShopCubit.get(context).favorites[model.id] == true
                            ? Colors.blue
                            : Colors.grey,
                    radius: 14.0,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 14.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
