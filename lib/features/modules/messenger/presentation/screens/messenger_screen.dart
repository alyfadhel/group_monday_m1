import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_monday_m1/features/modules/messenger/presentation/widgets/build_chat_item.dart';
import 'package:group_monday_m1/features/modules/messenger/presentation/widgets/build_story_item.dart';
import 'package:group_monday_m1/features/modules/messenger/data/model/messenger_model.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.dark,
        ),
        toolbarHeight: 70,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://www.environmentbuddy.com/wp-content/uploads/2023/01/Purple-flowers-worldwide.jpg',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 16.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 16.0,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10.0,
                    vertical: 3.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Search',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 170.0,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                  itemBuilder: (context, index) => BuildStoryItem(model: messenger[index]),
                  itemCount: messenger.length,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BuildChatItem(model: messenger[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: messenger.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




