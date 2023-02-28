import 'package:flutter/material.dart';

LiveUpdates(bool extended) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.8,
          strokeAlign: 1,
          color: Color(0xff6d96fa),
        ),
        borderRadius: BorderRadius.circular(10)),
    color: Color(0xffd7e2fe),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                    child: Image.asset(
                  'assets/liveUpdares.png',
                  height: 30,
                  width: 30,
                )),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    'Live Updates',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color(0xffd7e2fe),
                child: ListView.builder(
                    itemCount: 16,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ListTile(
                          style: ListTileStyle.drawer,
                          tileColor: Colors.white,
                          title: Text('The Hans India'),
                          subtitle: extended == false
                              ? Text(
                                  'JP Nadda spends 12 days a month outside Delhi in run-up to state polls',
                                  style: TextStyle(),
                                )
                              : Text(''),
                        ),
                      );
                    })),
              ),
            ),
          ]),
    ),
  );
}
