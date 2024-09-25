import 'package:flutter/material.dart';

class BuildTasksItem extends StatelessWidget {
  final Map model;
  const BuildTasksItem({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.blue,
            child: Text(
              model['time'],
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model['title'],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              Text(
                model['date'],
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
