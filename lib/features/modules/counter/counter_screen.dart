import 'package:flutter/material.dart';

// state less
// stateless contain one provide widget

//state full two classes
// First class provide widget
// second class provide state from this widget
// 1- constructor
//2- init state
//3- build

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

int count = 0;

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Counter',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {

                });
                count--;
                print(count);
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.blue,
                size: 50.0,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              '$count',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 15.0,
            ),
            IconButton(
              onPressed: () {
                setState(() {

                });
                count++;
                print(count);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
