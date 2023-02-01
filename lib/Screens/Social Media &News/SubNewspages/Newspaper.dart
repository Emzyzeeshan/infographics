import 'package:flutter/material.dart';

class NewsPaper extends StatefulWidget {
  const NewsPaper({super.key});

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'News Paper',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.newspaper,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        style: ListTileStyle.drawer,
                        leading: Text('Economic Times'),
                        subtitle: Text(
                            'JP Nadda spends 12 days a month outside Delhi in run-up to state polls'),
                      ),
                    );
                  })),
            ),
          ]),
    );
  }
}
