import 'package:flutter/material.dart';

// class CardWidget extends StatefulWidget {
//   const CardWidget({super.key});

//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }

// class _CardWidgetState extends State<CardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return

AB(data1) {
  print(1);
  return Scaffold(
      body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100],
            ),
            height: 150,
            // width: MediaQuery.of(context).size.width,

            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                'Population\n35M',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100],
            ),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                'Urban Percentage\n864',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100],
            ),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                'Muslim Population\n4.5M',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    ),
  ));
}
//   }
// }
