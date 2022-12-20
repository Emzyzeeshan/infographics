import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:integraphics/main.dart';

class Tooltips extends StatefulWidget {
  final VoidCallback? color;
  Tooltips({this.color, super.key});

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
              onPressed: widget.color,

              //  () {
              //   void changeColor(Color color) {
              //     setState(() {
              //       pickerColor = color;
              //     });
              //   }

              //   showDialog(
              //     context: context,
              //     builder: (context) => AlertDialog(
              //       title: const Text('Pick a color!'),
              //       content: SingleChildScrollView(
              //         child: ColorPicker(
              //           pickerColor: pickerColor,
              //           onColorChanged: changeColor,
              //         ),
              //         // Use Material color picker:
              //         //
              //         // child: MaterialPicker(
              //         //   pickerColor: pickerColor,
              //         //   onColorChanged: changeColor,
              //         //   showLabel: true, // only on portrait mode
              //         // ),
              //         //
              //         // Use Block color picker:
              //         //
              //         // child: BlockPicker(
              //         //   pickerColor: currentColor,
              //         //   onColorChanged: changeColor,
              //         // ),
              //         //
              //         // child: MultipleChoiceBlockPicker(
              //         //   pickerColors: currentColors,
              //         //   onColorsChanged: changeColors,
              //         // ),
              //       ),
              //       actions: <Widget>[
              //         ElevatedButton(
              //           child: const Text('Got it'),
              //           onPressed: () {
              //             setState(() => currentColor = pickerColor);
              //             Navigator.of(context).pop();
              //           },
              //         ),
              //       ],
              //     ),
              //   );
              // },
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
