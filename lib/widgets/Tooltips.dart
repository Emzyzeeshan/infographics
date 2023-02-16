import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:integraphics/Screens/Datatable.dart';

import 'package:integraphics/main.dart';

import 'package:integraphics/widgets/test.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mymodel;

import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'allcharts.dart';

class Tooltips extends StatefulWidget {
  ScreenshotController? screenshotController = ScreenshotController();
  final VoidCallback? color;
  final VoidCallback? delete;
  final VoidCallback? filter;
  String? ChartName;
  String? chartkey;
  Card? Zoomcard;
  Tooltips(
      {this.ChartName,
      this.filter,
      this.Zoomcard,
      this.color,
      this.delete,
      this.screenshotController,
      this.chartkey,
      super.key});

  @override
  State<Tooltips> createState() => _TooltipsState();
}

class _TooltipsState extends State<Tooltips> {
  void initstate() {
    final android = AndroidInitializationSettings('mipmap/ic_launcher');

    final initSettings = InitializationSettings(android: android);

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveBackgroundNotificationResponse: _onSelectNotification);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? localkey = widget.chartkey;
    List<Widget> allpage = [];
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Sampledatagrid(
                      chartkey: widget.chartkey,
                    );
                  })));
                },
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
              message: 'Filter',
              child: IconButton(
                onPressed: widget.filter,
                icon: Icon(
                  Icons.filter_alt_rounded,
                  size: 26,
                  color: Color(0xff00186a),
                ),
              ),
            ),
          ),

          Neumorphic(
            child: Tooltip(
              message: 'Chart Type',
              child: IconButton(
                onPressed: () {
                  ScreenshotController? screenshotControllerpie =
                      ScreenshotController();
                  showGeneralDialog(
                      transitionBuilder: (context, a1, a2, widget) {
                        return Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              content: Container(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Select Chart Type',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                mymodel
                                                    .showCupertinoModalBottomSheet(
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Screenshot(
                                                              controller:
                                                                  screenshotControllerpie,
                                                              child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  elevation: 10,
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  child: PiechartConvert(
                                                                      localkey!,
                                                                      context)),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child:
                                                                  MaterialButton(
                                                                color: Color(
                                                                    0xff6d96fa),
                                                                onPressed:
                                                                    () async {
                                                                  screenshotControllerpie
                                                                      .capture()
                                                                      .then(
                                                                          (value) async {
                                                                    // Uint8List capturedImage;
                                                                    var status =
                                                                        await Permission
                                                                            .storage
                                                                            .request();
                                                                    if (status
                                                                        .isGranted) {
                                                                      // String savePath = appDocDir.path+'/temp';
                                                                      final result = await ImageGallerySaver.saveImage(
                                                                          quality:
                                                                              100,
                                                                          value!,
                                                                          name:
                                                                              'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                      print(
                                                                          result);
                                                                      // screenshotController
                                                                      //     .captureAndSave(appDocDir.path);
                                                                    }
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .download_for_offline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                                Fluttertoast.showToast(
                                                    msg: "Converted to Pie",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.SNACKBAR,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color(0xff6d96fa),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              icon: Icon(
                                                Icons.pie_chart_sharp,
                                                size: 40,
                                                color: Color(0xff6d96fa),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                ScreenshotController
                                                    screenshotControllerDoughnut =
                                                    ScreenshotController();
                                                mymodel
                                                    .showCupertinoModalBottomSheet(
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Screenshot(
                                                              controller:
                                                                  screenshotControllerDoughnut,
                                                              child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  elevation: 10,
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  child: DoughnutConvert(
                                                                      localkey!,
                                                                      context)),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child:
                                                                  MaterialButton(
                                                                color: Color(
                                                                    0xff6d96fa),
                                                                onPressed:
                                                                    () async {
                                                                  screenshotControllerDoughnut
                                                                      .capture()
                                                                      .then(
                                                                          (value) async {
                                                                    // Uint8List capturedImage;
                                                                    var status =
                                                                        await Permission
                                                                            .storage
                                                                            .request();
                                                                    if (status
                                                                        .isGranted) {
                                                                      // String savePath = appDocDir.path+'/temp';
                                                                      final result = await ImageGallerySaver.saveImage(
                                                                          quality:
                                                                              100,
                                                                          value!,
                                                                          name:
                                                                              'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                      print(
                                                                          result);
                                                                      // screenshotController
                                                                      //     .captureAndSave(appDocDir.path);
                                                                    }
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .download_for_offline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Converted to Doughnut",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.SNACKBAR,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color(0xff6d96fa),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              icon: Icon(
                                                Icons.donut_large_sharp,
                                                size: 40,
                                                color: Color(0xff6d96fa),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                ScreenshotController
                                                    screenshotControllerColumn =
                                                    ScreenshotController();
                                                mymodel
                                                    .showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Screenshot(
                                                              controller:
                                                                  screenshotControllerColumn,
                                                              child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  elevation: 10,
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  child: ColumnConvert(
                                                                      localkey!,
                                                                      context)),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child:
                                                                  MaterialButton(
                                                                color: Color(
                                                                    0xff6d96fa),
                                                                onPressed:
                                                                    () async {
                                                                  screenshotControllerColumn
                                                                      .capture()
                                                                      .then(
                                                                          (value) async {
                                                                    // Uint8List capturedImage;
                                                                    var status =
                                                                        await Permission
                                                                            .storage
                                                                            .request();
                                                                    if (status
                                                                        .isGranted) {
                                                                      // String savePath = appDocDir.path+'/temp';
                                                                      final result = await ImageGallerySaver.saveImage(
                                                                          quality:
                                                                              100,
                                                                          value!,
                                                                          name:
                                                                              'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                      print(
                                                                          result);
                                                                      // screenshotController
                                                                      //     .captureAndSave(appDocDir.path);
                                                                    }
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .download_for_offline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                                Fluttertoast.showToast(
                                                    msg: "Converted to Column",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.SNACKBAR,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color(0xff6d96fa),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              icon: Icon(
                                                Icons.bar_chart,
                                                size: 40,
                                                color: Color(0xff6d96fa),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                ScreenshotController
                                                    screenshotControllerFunnel =
                                                    ScreenshotController();
                                                mymodel
                                                    .showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Screenshot(
                                                              controller:
                                                                  screenshotControllerFunnel,
                                                              child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  elevation: 10,
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  child: Funnelchartconvert(
                                                                      localkey!,
                                                                      context)),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child:
                                                                  MaterialButton(
                                                                color: Color(
                                                                    0xff6d96fa),
                                                                onPressed:
                                                                    () async {
                                                                  screenshotControllerFunnel
                                                                      .capture()
                                                                      .then(
                                                                          (value) async {
                                                                    // Uint8List capturedImage;
                                                                    var status =
                                                                        await Permission
                                                                            .storage
                                                                            .request();
                                                                    if (status
                                                                        .isGranted) {
                                                                      // String savePath = appDocDir.path+'/temp';
                                                                      final result = await ImageGallerySaver.saveImage(
                                                                          quality:
                                                                              100,
                                                                          value!,
                                                                          name:
                                                                              'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                      print(
                                                                          result);
                                                                      // screenshotController
                                                                      //     .captureAndSave(appDocDir.path);
                                                                    }
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .download_for_offline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                                Fluttertoast.showToast(
                                                    msg: "Converted to Funnel",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.SNACKBAR,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color(0xff6d96fa),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              icon: Icon(
                                                Icons.filter_alt_sharp,
                                                size: 40,
                                                color: Color(0xff6d96fa),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                ScreenshotController
                                                    screenshotControllerRadar =
                                                    ScreenshotController();
                                                mymodel
                                                    .showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Screenshot(
                                                              controller:
                                                                  screenshotControllerRadar,
                                                              child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  elevation: 10,
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  child: BarSeiesConvert(
                                                                      localkey!,
                                                                      context)),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child:
                                                                  MaterialButton(
                                                                color: Color(
                                                                    0xff6d96fa),
                                                                onPressed:
                                                                    () async {
                                                                  screenshotControllerRadar
                                                                      .capture()
                                                                      .then(
                                                                          (value) async {
                                                                    // Uint8List capturedImage;
                                                                    var status =
                                                                        await Permission
                                                                            .storage
                                                                            .request();
                                                                    if (status
                                                                        .isGranted) {
                                                                      // String savePath = appDocDir.path+'/temp';
                                                                      final result = await ImageGallerySaver.saveImage(
                                                                          quality:
                                                                              100,
                                                                          value!,
                                                                          name:
                                                                              'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                      print(
                                                                          result);
                                                                      // screenshotController
                                                                      //     .captureAndSave(appDocDir.path);
                                                                    }
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .download_for_offline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                                Fluttertoast.showToast(
                                                    msg: "Converted to Bar",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.SNACKBAR,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color(0xff6d96fa),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              icon: RotationTransition(
                                                turns: AlwaysStoppedAnimation(
                                                    90 / 360),
                                                child: Icon(
                                                  Icons.view_column,
                                                  size: 40,
                                                  color: Color(0xff6d96fa),
                                                ),
                                              )),
                                        ]),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              ScreenshotController
                                                  screenshotControllerRadar =
                                                  ScreenshotController();
                                              mymodel
                                                  .showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.7,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Screenshot(
                                                            controller:
                                                                screenshotControllerRadar,
                                                            child: Card(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                elevation: 10,
                                                                color: Colors
                                                                    .grey[200],
                                                                child: RadarCharttconvert(
                                                                    localkey!,
                                                                    context)),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child:
                                                                MaterialButton(
                                                              color: Color(
                                                                  0xff6d96fa),
                                                              onPressed:
                                                                  () async {
                                                                screenshotControllerRadar
                                                                    .capture()
                                                                    .then(
                                                                        (value) async {
                                                                  // Uint8List capturedImage;
                                                                  var status =
                                                                      await Permission
                                                                          .storage
                                                                          .request();
                                                                  if (status
                                                                      .isGranted) {
                                                                    // String savePath = appDocDir.path+'/temp';
                                                                    final result = await ImageGallerySaver.saveImage(
                                                                        quality:
                                                                            100,
                                                                        value!,
                                                                        name:
                                                                            'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                    print(
                                                                        result);
                                                                    // screenshotController
                                                                    //     .captureAndSave(appDocDir.path);
                                                                  }
                                                                });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Save',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .download_for_offline,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .then((value) =>
                                                      Navigator.pop(context));
                                              Fluttertoast.showToast(
                                                  msg: "Converted to Radar",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      Color(0xff6d96fa),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            },
                                            icon: Icon(
                                              Icons.webhook_outlined,
                                              size: 40,
                                              color: Color(0xff6d96fa),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              ScreenshotController
                                                  screenshotControllerLines =
                                                  ScreenshotController();
                                              mymodel
                                                  .showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.7,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Screenshot(
                                                            controller:
                                                                screenshotControllerLines,
                                                            child: Card(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                elevation: 10,
                                                                color: Colors
                                                                    .grey[200],
                                                                child: Lineschartconvert(
                                                                    localkey!,
                                                                    context)),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child:
                                                                MaterialButton(
                                                              color: Color(
                                                                  0xff6d96fa),
                                                              onPressed:
                                                                  () async {
                                                                screenshotControllerLines
                                                                    .capture()
                                                                    .then(
                                                                        (value) async {
                                                                  // Uint8List capturedImage;
                                                                  var status =
                                                                      await Permission
                                                                          .storage
                                                                          .request();
                                                                  if (status
                                                                      .isGranted) {
                                                                    // String savePath = appDocDir.path+'/temp';
                                                                    final result = await ImageGallerySaver.saveImage(
                                                                        quality:
                                                                            100,
                                                                        value!,
                                                                        name:
                                                                            'graph_${dataa['$localkey']['chartTitle']}_${DateTime.now()}');
                                                                    print(
                                                                        result);
                                                                    // screenshotController
                                                                    //     .captureAndSave(appDocDir.path);
                                                                  }
                                                                });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Save',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .download_for_offline,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .then((value) =>
                                                      Navigator.pop(context));
                                              Fluttertoast.showToast(
                                                  msg: "Converted to Lines",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      Color(0xff6d96fa),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            },
                                            icon: Icon(
                                              Icons.line_axis_rounded,
                                              size: 40,
                                              color: Color(0xff6d96fa),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      barrierLabel: '',
                      barrierDismissible: true,
                      transitionDuration: Duration(milliseconds: 200),
                      context: context,
                      pageBuilder: (context, animation1, animation2) {
                        return Container();
                      });
                  // showAnimatedDialog(context: context, builder: builder)
                },
                icon: Icon(
                  Icons.transform_outlined,
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
              message: 'Full Screen',
              child: IconButton(
                onPressed: () {
                  Keyidentify() {
                    if (dataa['${widget.chartkey}']['chartType'] == 'pie') {
                      return PiechartConvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'donut') {
                      return DoughnutConvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'column') {
                      return ColumnConvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'funnel') {
                      return Funnelchartconvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'bar') {
                      return BarSeiesConvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'scatterpolar') {
                      return RadarCharttconvert(widget.chartkey!, context);
                    } else if (dataa['${widget.chartkey}']['chartType'] ==
                        'lines') {
                      return Lineschartconvert(widget.chartkey!, context);
                    }
                  }

                  showDialog(
                      context: context,
                      builder: ((context) {
                        return Scaffold(
                            appBar: AppBar(
                              backgroundColor: Color(0xff6d96fa),
                            ),
                            body: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Center(child: Keyidentify())),
                                  ],
                                )));
                      }));
                  // widget.screenshotController!
                  //     .capture(delay: Duration(milliseconds: 10))
                  //     .then((capturedImage) async {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: ((context) =>
                  //               Zoomwidegt(capturedImage, widget.ChartName))));
                  // }).catchError((onError) {
                  //   print(onError);
                  // });
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
              message: 'Color pallete',
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
              message: 'Download',
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

  Future<void> _onSelectNotification(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    if (payload == true) {
      navigatorKey.currentState!
          .push(MaterialPageRoute(builder: ((context) => Test1(payload))));

      // await Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(builder: (context) => ),
      // );
    }

    // final obj = jsonDecode(json.toString());

    // if (jsonn == true) {
    //   AndroidNotificationAction(),
    //   OpenFilex.open(result['filePath']);
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (_) => AlertDialog(
    //       title: Text('Error'),
    //       content: Text('${result['errorMessage']}'),
    //     ),
    //   );
    // }
  }

  Future<void> _showNotification(bool downloadStatus) async {
    final android = AndroidNotificationDetails('channel id', 'channel name',
        icon: 'smartlogo', priority: Priority.high, importance: Importance.max);

    final platform = NotificationDetails(android: android);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus;

    await flutterLocalNotificationsPlugin.show(
        0, // notification id
        isSuccess ? 'Success' : 'Failure',
        isSuccess
            ? 'File has been downloaded successfully!'
            : 'There was an error while downloading the file.',
        platform,
        payload: json);
  }

  var result;
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
                                  result = await ImageGallerySaver.saveImage(
                                      quality: 100,
                                      capturedImage,
                                      name:
                                          'graph_${chartname}_${DateTime.now()}');
                                  print(result);
                                  if (result['isSuccess'] == true) {
                                    await _showNotification(
                                        result['isSuccess']);
                                  }
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
}
