import 'package:flutter/material.dart';

class Tooltips extends StatefulWidget {
  Tooltips({super.key});

  @override
  State<Tooltips> createState() => _TooltipsState();
}

class _TooltipsState extends State<Tooltips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 35,
      color: Colors.grey[300],
      child: ListView(
        padding: EdgeInsets.only(right: 1),
        shrinkWrap: true,
        children: [
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.grid_on_outlined,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt_rounded,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Delete',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fullscreen,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_note_sharp,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.auto_graph_sharp,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.color_lens_rounded,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shuffle,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.insights_rounded,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
          Tooltip(
            message: 'Show Data',
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.compare_rounded,
                size: 26,
                color: Color(0xff00186a),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
