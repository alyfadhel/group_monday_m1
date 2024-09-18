import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 70,
        // leadingWidth: 70,
        // leading: Icon(Icons.menu,),
        //centerTitle: true,
        title: const Text(
          'First App',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const IconButton(
            icon: Icon(
              Icons.search_rounded,
            ),
            onPressed: onPressed,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      // body: Container(
      //   color: Colors.purple,
      //   height: double.infinity,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Container(
      //         color: Colors.red,
      //         child: const Text(
      //           'First App',
      //           style: TextStyle(
      //             fontSize: 30.0,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // body: const SingleChildScrollView(
      //   physics: BouncingScrollPhysics(),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'First Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Second Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Third Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fourth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         'Fifth Project',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 30.0, start: 30.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0,),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://www.environmentbuddy.com/wp-content/uploads/2023/01/Purple-flowers-worldwide.jpg',
                      ),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.7,),
                  ),
                  child: const Text(
                    'Flower',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void onPressed() {
  print('Search');
}
