import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardWidet extends StatefulWidget {
  String Frontext;
  String Backtext;
  FlipCardWidet(this.Frontext, this.Backtext, {super.key});

  @override
  State<FlipCardWidet> createState() => _FlipCardWidetState();
}

class _FlipCardWidetState extends State<FlipCardWidet> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
                color: Color(0xff6d96fa).withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                widget.Frontext,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
          ),
        ],
      ),
      back: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            color: Color(0xff6d96fa).withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.Backtext,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
      ),
    );
  }
}
