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
    return Container(
      height: 70,
      width: 100,
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
                    height: 20,
                    width: 20,
                  ),
                ),
                Expanded(
                    child: Text(
                  softWrap: true,
                  widget.Frontext,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  maxLines: 2,
                )),
                Expanded(
                  child: Image.asset(
                    'assets/barimg.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            Text(
              '${widget.Backtext}',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '2021-2022',
              style: TextStyle(color: Colors.blueAccent, fontSize: 10),
            ),
          ],
        ),
      )),
    );

    // FlipCard(
    //   fill: Fill
    //       .fillBack, // Fill the back side of the card to make in the same size as the front.
    //   direction: FlipDirection.HORIZONTAL, // default
    //   front:
    //   back: Container(
    //     height: 150,
    //     width: 200,
    //     decoration: BoxDecoration(
    //         color: Color(0xff6d96fa).withOpacity(0.3),
    //         borderRadius: BorderRadius.circular(15)),
    //     child: Center(
    //         child: Padding(
    //             padding: const EdgeInsets.only(left: 10.0),
    //             child: AutoSizeText(
    //               widget.Backtext,
    //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //               maxLines: 2,
    //             ))),
    //   ),
    // );
  }
}
