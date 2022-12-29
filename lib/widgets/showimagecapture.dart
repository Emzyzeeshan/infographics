import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage, chartname) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6d96fa),
        title: Text("$chartname"),
      ),
      body: Center(
          child: capturedImage != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.memory(capturedImage),
                      ElevatedButton(
                          onPressed: () async {
                            // Uint8List capturedImage;
                            var status = await Permission.storage.request();
                            if (status.isGranted) {
                              // String savePath = appDocDir.path+'/temp';
                              final result = await ImageGallerySaver.saveImage(
                                  quality: 100,
                                  capturedImage,
                                  name: 'graph_${chartname}_${DateTime.now()}');

                              print(result);
                              // screenshotController
                              //     .captureAndSave(appDocDir.path);
                            }
                          },
                          child: Text('Save'))
                    ],
                  ),
                )
              : Container()),
    ),
  );
}
