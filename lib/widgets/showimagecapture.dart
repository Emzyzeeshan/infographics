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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.memory(capturedImage),
                        SizedBox(height: 20),
                        Container(
                          width: 120,
                          child: MaterialButton(
                            onPressed: () async {
                              // Uint8List capturedImage;
                              var status = await Permission.storage.request();
                              if (status.isGranted) {
                                // String savePath = appDocDir.path+'/temp';
                                final result = await ImageGallerySaver.saveImage(
                                    quality: 100,
                                    capturedImage,
                                    name:
                                        'graph_${chartname}_${DateTime.now()}');
                                print(result);
                                // screenshotController
                                //     .captureAndSave(appDocDir.path);
                              }
                            },
                            color: Color(0xff6d96fa),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.download_for_offline,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container()),
    ),
  );
}
