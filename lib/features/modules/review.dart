import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              // try{
              //   var name = await getName();
              //   print(name);
              //   throw('Error is !!!');
              // }catch(error)
              // {
              //   print(error.toString());
              // }
              var name = getName()
                  .then(
                    (value) {
                      print(value);
                      throw('Error is !!!');
                    },
                  ).catchError(
                    (error) {
                      print(error.toString());
                    },
                  );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getName() async {
  return 'Aly Fadhel';
}
