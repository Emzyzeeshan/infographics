import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/error.gif'),
        Text(
          'Please Restart and Verify Identity',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
      ],
    ));
  }
}
