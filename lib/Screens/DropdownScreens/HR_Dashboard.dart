import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:integraphics/Constants/ChartScreenshotcontroller.dart';
import 'package:integraphics/Constants/colorpalette.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/widgets/ChartSampledata.dart';
import 'package:integraphics/widgets/Colorsfunction.dart';
import 'package:integraphics/widgets/Flipcard.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../main.dart';

class HR_Dashboard extends StatefulWidget {
  const HR_Dashboard({super.key});

  @override
  State<HR_Dashboard> createState() => _HR_DashboardState();
}

class _HR_DashboardState extends State<HR_Dashboard> {
  List<Map> Pielist = [];
  // Map pichart;
  int count = 0;
  var singlekey;

  @override
  void initState() {
    Funneltooltip = TooltipBehavior(enable: true, format: 'point.x : point.y');
    PositionsStatus_tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    PositionsCountbyLocation_tooltipBehavior =
        TooltipBehavior(enable: true, canShowMarker: false, header: '');
    EmployeesCountByAge_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    // TODO: implement initState
    super.initState();
  }

  Color pickerColor = Color(0xff443a49);
  TooltipBehavior PositionsStatus_tooltipBehavior = TooltipBehavior();
  TooltipBehavior Funneltooltip = TooltipBehavior();
  TooltipBehavior PositionsCountbyLocation_tooltipBehavior = TooltipBehavior();
  TooltipBehavior EmployeesCountByAge_tooltipBehavior = TooltipBehavior();
  List<Function> Cardlist = [];
  @override
  Widget build(BuildContext context) {
    late Future<dynamic> _value = AllChartdataAPi(context, Selectedinput);
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: _value,
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitSpinningLines(
                lineWidth: 5,
                size: 100,
                color: Color(0xff6d96fa),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Body();
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Body() {
    List<Widget> Doughnutt = [];
    List doughnutcount = [];
    List<Widget> piedata = [];
    List piecount = [];
    List scattercount = [];
    List Linescount = [];
    List<Widget> Columndata = [];
    List columncount = [];
    List<Widget> Bardata = [];
    List<Widget> FunnelData = [];
    List Barcount = [];
    List<Widget> Scatterdata = [];
    List<Widget> Spline = [];
    List sortlist = [];
    print('----------');
    print('Get keys:');
    // Get all keys
    dataa.keys.forEach((key) {
      singlekey = key;

      if (dataa['$key']['chartType'] == 'pie') {
        piecount.add(key);
        Piechart(String chartname) {
          List<ChartSampleData> Piechart = [];
          for (int i = 0;
              i < dataa['$chartname']['chartLevelsAndValueObj'].length;
              i++) {
            Piechart.add(
              ChartSampleData(
                  x: dataa['$chartname']['chartLevelsAndValueObj'][i]['X']
                      .toString(),
                  y: dataa['$chartname']['chartLevelsAndValueObj'][i]['Y'],
                  text:
                      ' ${(dataa['$chartname']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['$chartname']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
            );
          }
          return Expanded(
            child: Screenshot(
              controller: PieScreeshotcontrollerlist[piedata.length],
              child: Card(
                child: SfCircularChart(
                  palette: dataa['$chartname']['chartTitle'] ==
                          'No  Of Vacancies By Position '
                      ? [
                          Color(0xff2f6345),
                          Color(0xff40875e),
                          Color.fromRGBO(75, 135, 185, 1),
                          Color.fromRGBO(192, 108, 132, 1),
                          Color.fromRGBO(246, 114, 128, 1),
                          Color.fromRGBO(248, 177, 149, 1),
                          Color.fromRGBO(116, 180, 155, 1),
                          Color.fromRGBO(0, 168, 181, 1),
                          Color.fromRGBO(73, 76, 162, 1),
                          Color.fromRGBO(255, 205, 96, 1),
                          Color.fromRGBO(255, 240, 219, 1),
                          Color.fromRGBO(238, 238, 238, 1)
                        ]
                      : [
                          Color(0xff2f6345),
                          Color(0xff40875e),
                        ],
                  title:
                      ChartTitle(text: '${dataa['$chartname']['chartTitle']}'),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom,
                  ),
                  series: <PieSeries<ChartSampleData, String>>[
                    PieSeries<ChartSampleData, String>(
                        enableTooltip: true,
                        explode: true,
                        explodeIndex: 0,
                        explodeOffset: '10%',
                        dataSource: Piechart,
                        xValueMapper: (ChartSampleData dataa, _) =>
                            dataa.x as String,
                        yValueMapper: (ChartSampleData dataa, _) => dataa.y,
                        dataLabelMapper: (ChartSampleData dataa, _) =>
                            dataa.text,
                        startAngle: 0,
                        endAngle: 0,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                  ],
                ),
              ),
            ),
          );
        }

        piedata.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Piechart(key),
                      Tooltips(
                        screenshotController:
                            PieScreeshotcontrollerlist[piedata.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
        print('piechart');
      } else if (dataa['$key']['chartType'] == 'donut') {
        //Doughnut chart
        Doughnut(String donutchart) {
          List<ChartSampleData> EmployeesCountByWorkExperience = [];
          for (int i = 0;
              i < dataa['$donutchart']['chartLevelsAndValueObj'].length;
              i++) {
            EmployeesCountByWorkExperience.add(
              ChartSampleData(
                x: dataa['$donutchart']['chartLevelsAndValueObj'][i]['X']
                    .toString(),
                y: dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'],
                text:
                    ' ${dataa['$donutchart']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'].toString()}',
              ),
            );
          }
          return Expanded(
            child: Screenshot(
              controller: DonutScreeshotcontrollerlist[Doughnutt.length],
              child: Card(
                child: SfCircularChart(
                  palette: selectedpallete[Doughnutt.length],
                  legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap),
                  title: ChartTitle(
                      text: '${dataa['$donutchart']['chartTitle']}',
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  series: <DoughnutSeries<ChartSampleData, String>>[
                    DoughnutSeries<ChartSampleData, String>(
                        explode: true,
                        explodeIndex: 0,
                        explodeOffset: '10%',
                        dataSource: EmployeesCountByWorkExperience,
                        xValueMapper: (ChartSampleData dataa, _) =>
                            dataa.x as String,
                        yValueMapper: (ChartSampleData dataa, _) => dataa.y,
                        dataLabelMapper: (ChartSampleData dataa, _) =>
                            dataa.text,
                        startAngle: 90,
                        endAngle: 90,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                  ],
                ),
              ),
            ),
          );
        }

        doughnutcount.add(key);
        Doughnutt.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Doughnut(key),
                      Tooltips(
                        screenshotController:
                            DonutScreeshotcontrollerlist[Doughnutt.length],
                        ChartName: dataa['$key']['chartTitle'],
                        color: () {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    content: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 150,
                                      width: 150,
                                      child: Colorpanel(
                                        ontapblue: () {
                                          setState(() {
                                            selectedpallete[Doughnutt.length] =
                                                Allcolorpalette[0];
                                          });
                                          Navigator.pop(context);
                                        },
                                        ontapGreen: () {
                                          setState(() {
                                            selectedpallete[Doughnutt.length] =
                                                Allcolorpalette[1];
                                          });
                                          Navigator.pop(context);
                                        },
                                        ontapred: () {
                                          setState(() {
                                            selectedpallete[Doughnutt.length] =
                                                Allcolorpalette[2];
                                          });
                                          Navigator.pop(context);
                                        },
                                        ontappink: () {
                                          setState(() {
                                            selectedpallete[Doughnutt.length] =
                                                Allcolorpalette[3];
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  )));
                        },
                      )
                    ],
                  ))),
        );
        print('doughnut');
      } else if (dataa['$key']['chartType'] == 'column') {
        Color color1 = Colors.pink.shade500;
        Color color2 = Colors.orange.shade500;
        Color color3 = Colors.red.shade500;
        Color color4 = Colors.blue.shade500;
        Color color5 = Colors.green.shade500;
        Color color6 = Colors.red.shade500;
        Color color7 = Colors.blue.shade500;
        Color color8 = Colors.green.shade500;
        List<Color> allcolor = [
          color1,
          color2,
          color3,
          color4,
          color5,
          color6,
          color7,
          color8
        ];
        Column(String Coloumnchart) {
          List<ChartSampleData> EmployeesCountByAge = [];
          for (int i = 0;
              i < dataa['$Coloumnchart']['chartLevelsAndValueObj'].length;
              i++) {
            EmployeesCountByAge.add(
              ChartSampleData(
                x: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X']
                    .toString(),
                y: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'],
                text:
                    '${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
              ),
            );
          }
          return Expanded(
            child: Screenshot(
              controller: ColumnScreeshotcontrollerlist[Columndata.length],
              child: Card(
                child: SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                      enableDoubleTapZooming: true,
                      enableSelectionZooming: true,
                      enablePanning: true,
                      enablePinching: true),
                  tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
                  // palette: <Color>[allcolor[Columndata.length]],
                  plotAreaBorderWidth: 0,
                  title: ChartTitle(
                      text: '${dataa['$Coloumnchart']['chartTitle']}',
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  primaryXAxis: CategoryAxis(
                    isVisible: true,
                    majorGridLines: const MajorGridLines(width: 1),
                  ),
                  primaryYAxis: NumericAxis(
                      isVisible: true,
                      axisLine: const AxisLine(width: 1),
                      labelFormat: '{value}',
                      majorTickLines: const MajorTickLines(size: 0)),
                  series: <ColumnSeries<ChartSampleData, String>>[
                    ColumnSeries<ChartSampleData, String>(
                      color: allcolor[Columndata.length],
                      isVisible: true,
                      dataSource: EmployeesCountByAge,
                      xValueMapper: (ChartSampleData sales, _) =>
                          sales.x as String,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, textStyle: TextStyle(fontSize: 10)),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        columncount.add(key);
        Columndata.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Column(key),
                      Tooltips(
                        color: () {
                          void changeColor(Color color) {
                            pickerColor = color;
                          }

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(() {
                                      allcolor[columncount.length] =
                                          pickerColor;
                                    });

                                    print(pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        screenshotController:
                            ColumnScreeshotcontrollerlist[Columndata.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
        print('column');
      } else if (dataa['$key']['chartType'] == 'bar') {
        BarSeies(String Bar) {
          List<ChartSampleData> PositionsCountbyLocation = [];
          for (int i = 0;
              i < dataa['$Bar']['chartLevelsAndValueObj'].length;
              i++) {
            PositionsCountbyLocation.add(
              ChartSampleData(
                x: dataa['$Bar']['chartLevelsAndValueObj'][i]['X'],
                y: dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'],
                text:
                    '${dataa['$Bar']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'].toString()}',
              ),
            );
          }

          return Expanded(
            child: Screenshot(
              controller: BarScreeshotcontrollerlist[Bardata.length],
              child: Card(
                child: SfCartesianChart(
                  tooltipBehavior: PositionsCountbyLocation_tooltipBehavior,
                  palette: <Color>[
                    Color(0xff1864b1),
                  ],
                  title: ChartTitle(
                      text: '${dataa['$Bar']['chartTitle']}',
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 1),
                  ),
                  primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: dataa['$Bar']['chartTitle'] ==
                              'Employees Count by Department'
                          ? 2
                          : 90,
                      interval: dataa['$Bar']['chartTitle'] ==
                              'Employees Count by Department'
                          ? 1
                          : 20,
                      majorGridLines: const MajorGridLines(width: 1),
                      majorTickLines: const MajorTickLines(size: 0)),
                  series: <ChartSeries<ChartSampleData, String>>[
                    BarSeries<ChartSampleData, String>(
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      dataSource: PositionsCountbyLocation,
                      xValueMapper: (ChartSampleData sales, _) =>
                          sales.x as String,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                    )
                  ],
                ),
              ),
            ),
          );
        }

        Barcount.add(key);
        Bardata.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      BarSeies(key),
                      Tooltips(
                        screenshotController:
                            BarScreeshotcontrollerlist[Bardata.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
        print('bar');
      } else if (dataa['$key']['chartType'] == 'funnel') {
        Funnelchart(String Funneldata) {
          List<ChartSampleData> Funnelchart = [];
          for (int i = 0;
              i < dataa['$Funneldata']['chartLevelsAndValueObj'].length;
              i++) {
            Funnelchart.add(
              ChartSampleData(
                x: dataa['$Funneldata']['chartLevelsAndValueObj'][i]['X']
                    .toString(),
                y: dataa['$Funneldata']['chartLevelsAndValueObj'][i]['Y'],
                text:
                    '${dataa['$Funneldata']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Funneldata']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
              ),
            );
          }
          return Expanded(
            child: Screenshot(
              controller: FunnelScreeshotcontrollerlist[FunnelData.length],
              child: Card(
                child: SfFunnelChart(
                  //   smartLabelMode: SmartLabelMode.none,
                  title:
                      ChartTitle(text: '${dataa['$Funneldata']['chartTitle']}'),
                  tooltipBehavior: Funneltooltip,

                  /// To enable the legend for funnel chart.
                  // legend:
                  //     Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),

                  series: FunnelSeries<ChartSampleData, String>(
                      dataSource: Funnelchart,
                      //   textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
                      xValueMapper: (ChartSampleData dataa, _) =>
                          dataa.x as String,
                      yValueMapper: (ChartSampleData dataa, _) => dataa.y,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.inside)),
                ),
              ),
            ),
          );
        }

        FunnelData.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Funnelchart(key),
                      Tooltips(
                        screenshotController:
                            FunnelScreeshotcontrollerlist[FunnelData.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
        print('funnel');
      } else if (dataa['$key']['chartType'] == 'scatter') {
        scattercount.add(key);
        Scatterchart(String Scatterdataa) {
          List<ChartSampleData> Scatterchart = [];
          for (int i = 0;
              i < dataa['$Scatterdataa']['chartLevelsAndValueObj'].length;
              i++) {
            Scatterchart.add(
              ChartSampleData(
                  x: dataa['$Scatterdataa']['chartLevelsAndValueObj'][i]['X']
                      .toString(),
                  y: dataa['$Scatterdataa']['chartLevelsAndValueObj'][i]['Y'],
                  size: 0.37,
                  pointColor: Colors.purple),
            );
          }
          return Expanded(
            child: Screenshot(
              controller: ScatterScreeshotcontrollerlist[Scatterdata.length],
              child: Card(
                child: SfCartesianChart(
                  // tooltipBehavior: DemandBySubCategory_tooltipBehavior,
                  title: ChartTitle(
                      text: '${dataa['$Scatterdataa']['chartTitle']}'),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      labelIntersectAction: AxisLabelIntersectAction.trim),
                  primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      minimum: 0,
                      maximum: 600000,
                      rangePadding: ChartRangePadding.additional,
                      majorTickLines: const MajorTickLines(size: 0)),
                  series: <BubbleSeries<ChartSampleData, String>>[
                    BubbleSeries<ChartSampleData, String>(
                      dataSource: Scatterchart,
                      opacity: 0.8,
                      xValueMapper: (ChartSampleData sales, _) =>
                          sales.x as String,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                      maximumRadius: 2,

                      /// It helps to render a bubble series as various colors,
                      /// which is given by user from dataa soruce.
                      pointColorMapper: (ChartSampleData sales, _) =>
                          sales.pointColor,
                      sizeValueMapper: (ChartSampleData sales, _) => 2,
                    )
                  ],
                  // tooltipBehavior: _tooltipBehavior,
                ),
              ),
            ),
          );
        }

        Scatterdata.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Scatterchart(key),
                      Tooltips(
                        screenshotController:
                            ScatterScreeshotcontrollerlist[Scatterdata.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
      } else if (dataa['$key']['chartType'] == 'lines') {
        Linescount.add(key);
        Lineschart(String Lineschart) {
          List<ChartSampleData> Linescharts = [];

          for (int i = 0;
              i < dataa['$Lineschart']['chartLevelsAndValueObj'].length;
              i++) {
            Linescharts.add(
              ChartSampleData(
                  x: dataa['$Lineschart']['chartLevelsAndValueObj'][i]['X']
                      .toString(),
                  y: dataa['$Lineschart']['chartLevelsAndValueObj'][i]['Y'],
                  size: 0.37,
                  pointColor: Colors.purple),
            );

            sortlist
                .add(dataa['$Lineschart']['chartLevelsAndValueObj'][i]['Y']);
          }
          print(sortlist.reduce((curr, next) => curr > next ? curr : next));
          print(sortlist.reduce((curr, next) => curr < next ? curr : next));
          return Expanded(
            child: Screenshot(
              controller: LinesScreeshotcontrollerlist[Spline.length],
              child: Card(
                child: SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                      enableDoubleTapZooming: true,
                      enableSelectionZooming: true,
                      enablePanning: true,
                      enablePinching: true),
                  plotAreaBorderWidth: 0,
                  title:
                      ChartTitle(text: '${dataa['$Lineschart']['chartTitle']}'),
                  primaryXAxis: CategoryAxis(
                      labelRotation: 20,
                      labelsExtent: 50,
                      majorGridLines: const MajorGridLines(width: 0),
                      labelPlacement: LabelPlacement.onTicks),
                  primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 2000,
                      axisLine: const AxisLine(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      labelFormat: '{value}',
                      majorTickLines: const MajorTickLines(size: 0)),
                  series: <SplineSeries<ChartSampleData, String>>[
                    SplineSeries<ChartSampleData, String>(
                      dataSource: Linescharts,
                      xValueMapper: (ChartSampleData sales, _) =>
                          sales.x as String,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ),
            ),
          );
        }

        Spline.add(
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              color: Colors.grey[200],
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Lineschart(key),
                      Tooltips(
                        screenshotController:
                            LinesScreeshotcontrollerlist[Spline.length],
                        ChartName: dataa['$key']['chartTitle'],
                      )
                    ],
                  ))),
        );
        print('Lines: ${Linescount.toList()}');
      }
    });

    // print('pie: ${piecount.toList()}');
    // print('Column: ${columncount.toList()}');
    // print('Bar: ${Barcount.toList()}');
    // print('doughnut: ${doughnutcount.toList()}');
    // print('Scatter: ${scattercount.toList()}');
    //
    List<Widget> all = [
      ...piedata,
      ...Doughnutt,
      ...Columndata,
      ...Bardata,
      ...FunnelData,
      ...Scatterdata,
      ...Spline
    ];
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
      if (constraints.maxWidth >= 480) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: all.length,
                itemBuilder: ((context, index) {
                  return all[index];
                })));
      } else {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                Selectedinput == 'CRM'
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // FlipCardWidet(
                            //   dataa['cardData6']['result'][2].toString(),
                            //   dataa['cardData6']['result'][0].toString(),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData12']['result'][2].toString(),
                            //   dataa['cardData12']['result'][0].toString(),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData13']['result'][2].toString(),
                            //   dataa['cardData13']['result'][0].toString(),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData14']['result'][2].toString(),
                            //   dataa['cardData14']['result'][0].toString(),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData24']['result'][2].toString(),
                            //   dataa['cardData24']['result'][0].toString(),
                            // ),
                          ],
                        ),
                      )
                    : Container(),
                ...piedata,
                ...Doughnutt,
                ...Columndata,
                ...Bardata,
                ...FunnelData,
                ...Scatterdata,
                ...Spline
              ],
            ));
      }
    });
  }
}
