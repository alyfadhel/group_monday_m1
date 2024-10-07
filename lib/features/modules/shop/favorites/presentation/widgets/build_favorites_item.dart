import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/layout/shop_layout/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/shared/themes/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/shop/favorites/data/model/favorites_model.dart';
import 'package:shimmer/shimmer.dart';

class BuildFavoritesItem extends StatelessWidget {
  final FavoritesDetailsProductModel model;
  const BuildFavoritesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                width: 150.0,
                fit: BoxFit.cover,
                imageUrl:
                model.image,
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
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ThemeCubit.get(context).isDark
                          ? Colors.black
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.round().toString(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        model.oldPrice.round().toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.red,
                          fontSize: 14.0,
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
                        icon: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 14.0,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
