import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Zoomwidegt extends StatefulWidget {
  Uint8List? image;
  String? chartname;
  Zoomwidegt(this.image, this.chartname, {super.key});

  @override
  State<Zoomwidegt> createState() => _ZoomwidegtState();
}

class _ZoomwidegtState extends State<Zoomwidegt> {
  @override
  void initState() {
    print('${widget.chartname}');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.chartname}',
        ),
        backgroundColor: Color(0xff6d96fa),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
          child: Container(
              child: PhotoView(imageProvider: MemoryImage(widget.image!)))),
    );
  }
}
