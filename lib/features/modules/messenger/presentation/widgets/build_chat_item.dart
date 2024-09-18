import 'package:flutter/material.dart';
import 'package:group_monday_m1/features/modules/messenger/data/model/messenger_model.dart';

class BuildChatItem extends StatelessWidget {
  final MessengerModel model;

  const BuildChatItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                model.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 5.0,
          backgroundColor: Colors.blue,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          '02:00 pm',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
