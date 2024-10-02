import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/shared/widgets/build_article.dart';



class BuildBusinessItem extends StatelessWidget {
  final Map model;

  const BuildBusinessItem({
    super.key,
    required this.model,

  });

  @override
  Widget build(BuildContext context)
  {
    return BuildArticle(model: model,);
  }
}
