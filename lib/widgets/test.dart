import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  var load;
  Test1(this.load, {super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        height: 100,
        width: 100,
        child: Column(children: [
          widget.load,
        ]),
      ),
    );
  }
}
