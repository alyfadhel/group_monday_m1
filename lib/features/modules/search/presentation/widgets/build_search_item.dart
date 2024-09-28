import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/shared/widgets/build_article.dart';



class BuildSearchItem extends StatelessWidget {
  final Map model;

  const BuildSearchItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context)
  {
    return BuildArticle(model: model,);
  }
}
