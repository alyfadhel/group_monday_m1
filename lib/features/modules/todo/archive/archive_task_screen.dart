import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/widgets/build_item.dart';

class ArchiveTaskScreen extends StatelessWidget {
  const ArchiveTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return BuildItem(tasks: tasks);
      },
    );
  }
}
