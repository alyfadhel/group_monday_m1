import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/news_layout/controller/cubit.dart';
import 'package:group_monday_m1/core/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/shared/widgets/build_news_items.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                NewsCubit.get(context).searchController.clear();
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
                  radius: 15.0,
                  controller: cubit.searchController,
                  type: TextInputType.text,
                  label: 'search',
                  prefix: Icons.search,
                  onChanged: (value) {
                    cubit.getSearchData(
                      value: value,
                    );
                  }, validator: (value) {},
                ),
                Expanded(
                  child: BuildNewsItems(
                    list: cubit.search,
                    isLoading: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
