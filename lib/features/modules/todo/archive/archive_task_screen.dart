import 'package:flutter/material.dart';

class ArchiveTaskScreen extends StatelessWidget {
  const ArchiveTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Archive Tasks',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
