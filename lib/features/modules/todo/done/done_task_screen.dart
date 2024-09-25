import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Done Tasks',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
