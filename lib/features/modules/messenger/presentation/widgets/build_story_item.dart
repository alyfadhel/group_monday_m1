import 'package:flutter/material.dart';
import 'package:group_monday_m1/features/modules/messenger/data/model/messenger_model.dart';

class BuildStoryItem extends StatelessWidget {
  final MessengerModel model;

  const BuildStoryItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 43,
              backgroundColor: Colors.white,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                      model.images,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
