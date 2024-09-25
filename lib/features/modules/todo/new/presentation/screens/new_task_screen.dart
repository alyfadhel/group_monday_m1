import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/controller/cubit/state.dart';
import 'package:group_monday_m1/core/layout/todo_app.dart';
import 'package:group_monday_m1/features/modules/todo/new/presentation/widgets/build_tasks_item.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).tasks;
        return ConditionalBuilder(
          condition: tasks.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => BuildTasksItem(
              model: tasks[index],
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            itemCount: tasks.length,
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Tasks Yet',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.grey,
                    fontSize: 50.0,
                      ),
                ),
                const Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 50.0,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
