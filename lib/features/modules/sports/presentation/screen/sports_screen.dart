import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/news_layout/controller/cubit.dart';
import 'package:group_monday_m1/core/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/shared/widgets/build_news_items.dart';




class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return BuildNewsItems(list: list,);
      },
    );
  }
}