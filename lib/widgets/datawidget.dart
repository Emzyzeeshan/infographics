import 'package:flutter/material.dart';

class Datadisplay extends StatefulWidget {
  Widget? displaycard;
  Datadisplay({this.displaycard, super.key});

  @override
  State<Datadisplay> createState() => _DatadisplayState();
}

class _DatadisplayState extends State<Datadisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget.displaycard,
      ),
    );
  }
}
