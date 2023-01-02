import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/showimagecapture.dart';
import 'package:integraphics/widgets/zoomwidget.dart';
import 'package:screenshot/screenshot.dart';

class Tooltips extends StatefulWidget {
  ScreenshotController? screenshotController = ScreenshotController();
  final VoidCallback? color;
  final VoidCallback? delete;
  String? ChartName;
  // final VoidCallback? download;
  Card? Zoomcard;
  Tooltips(
      {this.ChartName,
      this.Zoomcard,
      this.color,
      this.delete,
      this.screenshotController,
      super.key});

  @override
  State<Tooltips> createState() => _TooltipsState();
}

class _TooltipsState extends State<Tooltips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Neumorphic(
            child: Tooltip(
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
          ),
          Neumorphic(
            child: Tooltip(
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
          ),
          // Tooltip(
          //   message: 'Delete',
          //   child: IconButton(
          //     onPressed: widget.delete,
          //     icon: Icon(
          //       Icons.delete,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          Neumorphic(
            child: Tooltip(
              message: 'Show Data',
              child: IconButton(
                onPressed: () {
                  widget.screenshotController!
                      .capture(delay: Duration(milliseconds: 10))
                      .then((capturedImage) async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                Zoomwidegt(capturedImage, widget.ChartName))));
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                icon: Icon(
                  Icons.fullscreen,
                  size: 26,
                  color: Color(0xff00186a),
                ),
              ),
            ),
          ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.edit_note_sharp,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.auto_graph_sharp,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          Neumorphic(
            child: Tooltip(
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
          ),
          Neumorphic(
            child: Tooltip(
              message: 'Show Data',
              child: IconButton(
                onPressed: () {
                  widget.screenshotController!
                      .capture(delay: Duration(milliseconds: 10))
                      .then((capturedImage) async {
                    ShowCapturedWidget(
                        context, capturedImage!, widget.ChartName);
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 26,
                  color: Color(0xff00186a),
                ),
              ),
            ),
          ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.shuffle,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.home,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.insights_rounded,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
          // Tooltip(
          //   message: 'Show Data',
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.compare_rounded,
          //       size: 26,
          //       color: Color(0xff00186a),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
