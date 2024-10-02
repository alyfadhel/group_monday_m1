import 'package:flutter/material.dart';
import 'package:group_monday_m1/features/modules/shop/on_boarding/data/model/on_boarding_model.dart';

class BuildOnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const BuildOnBoardingItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              model.image,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.titleLarge,
        ),

      ],
    );
  }
}
