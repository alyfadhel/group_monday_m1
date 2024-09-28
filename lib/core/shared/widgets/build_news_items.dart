import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/shared/widgets/build_article.dart';


class BuildNewsItems extends StatelessWidget {
  final List<dynamic> list;
  final bool isLoading;

  const BuildNewsItems({
    super.key,
    required this.list,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty ,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => BuildArticle(
          model: list[index],
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: list.length,
        addSemanticIndexes: false,
        shrinkWrap: true,
      ),
      fallback: (context) => Center(
        child: isLoading ? Container() : const CircularProgressIndicator(),
      ),
    );
  }
}
