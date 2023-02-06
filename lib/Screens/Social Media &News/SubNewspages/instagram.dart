import 'package:flutter/material.dart';

Instagram(bool extended) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
                child: Image.asset(
              'assets/insta.png',
              height: 40,
              width: 40,
            )),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                'Instagram',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.white,
        ),
        Expanded(
          child: Card(
            color: Color(0xffd7e2fe),
            child: ListView.builder(
                itemCount: 16,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      tileColor: Colors.white,
                      title: Text('BALKA SUMAN'),
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
      ]);
}
