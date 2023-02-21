import 'package:auto_size_text/auto_size_text.dart';
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
      front: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
            color: Color(0xff6d96fa).withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/database.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Expanded(
                      child: AutoSizeText(
                    softWrap: true,
                    widget.Frontext,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  )),
                  Expanded(
                    child: Image.asset(
                      'assets/barimg.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '2021-2022',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
        )),
      ),
      back: Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
            color: Color(0xff6d96fa).withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: AutoSizeText(
                  widget.Backtext,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ))),
      ),
    );
  }
}
