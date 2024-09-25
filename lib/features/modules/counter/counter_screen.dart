import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/features/modules/counter/controller/cubit/cubit.dart';
import 'package:group_monday_m1/features/modules/counter/controller/cubit/state.dart';

// state less
// stateless contain one provide widget

//state full two classes
// First class provide widget
// second class provide state from this widget
// 1- constructor
//2- init state
//3- build

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = CounterCubit.get(context);
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
                      // setState(() {
                      //
                      // });
                      // count--;
                      // print(count);
                      cubit.decrementCounter();
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
                    cubit.counter.toString(),
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
                      cubit.incrementCounter();
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
        },
      ),
    );
  }
}




