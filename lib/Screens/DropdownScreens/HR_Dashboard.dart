import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/widgets/ChartSampledata.dart';
import 'package:integraphics/widgets/Flipcard.dart';
import 'package:integraphics/widgets/Tooltips.dart';
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
    PositionsStatus_tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    PositionsCountbyLocation_tooltipBehavior =
        TooltipBehavior(enable: true, canShowMarker: false, header: '');
    EmployeesCountByAge_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    // TODO: implement initState
    super.initState();
  }

  TooltipBehavior PositionsStatus_tooltipBehavior = TooltipBehavior();
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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeesCountbyWorkExperience(),
                                Tooltips(),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeesCountbyAge(),
                                Tooltips(
                                  color: () {
                                    void changeColor(Color color) {
                                      setState(() {
                                        pickerColor = color;
                                      });
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
                                          // Use Material color picker:
                                          //
                                          // child: MaterialPicker(
                                          //   pickerColor: pickerColor,
                                          //   onColorChanged: changeColor,
                                          //   showLabel: true, // only on portrait mode
                                          // ),
                                          //
                                          // Use Block color picker:
                                          //
                                          // child: BlockPicker(
                                          //   pickerColor: currentColor,
                                          //   onColorChanged: changeColor,
                                          // ),
                                          //
                                          // child: MultipleChoiceBlockPicker(
                                          //   pickerColors: currentColors,
                                          //   onColorsChanged: changeColors,
                                          // ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: const Text('Got it'),
                                            onPressed: () {
                                              setState(() =>
                                                  currentColor = pickerColor);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                NoofPositionsByDesignation(),
                                Tooltips(),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                NoOfL1InterviewsTakenByStatus(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                NoOfL2InterviewsTakenByStatus(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                NoofProfilesShortlistedbyStatus(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [NoOfVacanciesByPosition(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeesCountbyBloodGroup(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [TotalEmployeesCount(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeeCountbyDesignation(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                PositionsCountbyLocation(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeesCountbyMaritalStatus(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                EmployeesCountbyDepartment(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [PositionsStatus(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [EmployeesCountbyGender(), Tooltips()],
                            )),
                      ),
                    ],
                  ),
                ),
              );
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

  // Body() {
  //   List<Widget> Doughnutt = [];
  //   List doughnutcount = [];
  //   List<Widget> piedata = [];
  //   List piecount = [];
  //   List<Widget> Columndata = [];
  //   List columncount = [];
  //   List<Widget> Bardata = [];
  //   List Barcount = [];

  //   print('----------');
  //   print('Get keys:');
  //   // Get all keys
  //   dataa.keys.forEach((key) {
  //     singlekey = key;

  //     if (dataa['$key']['chartType'] == 'pie') {
  //       piecount.add(key);
  //       piedata.add(
  //         Card(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15)),
  //             elevation: 10,
  //             color: Colors.grey[200],
  //             child: Padding(
  //                 padding: EdgeInsets.all(12),
  //                 child: Row(
  //                   children: [Piechart(key), Tooltips()],
  //                 ))),
  //       );
  //     } else if (dataa['$key']['chartType'] == 'donut') {
  //       doughnutcount.add(key);
  //       Doughnutt.add(
  //         Card(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15)),
  //             elevation: 10,
  //             color: Colors.grey[200],
  //             child: Padding(
  //                 padding: EdgeInsets.all(12),
  //                 child: Row(
  //                   children: [Doughnut(key), Tooltips()],
  //                 ))),
  //       );
  //     } else if (dataa['$key']['chartType'] == 'column') {
  //       columncount.add(key);
  //       Columndata.add(
  //         Card(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15)),
  //             elevation: 10,
  //             color: Colors.grey[200],
  //             child: Padding(
  //                 padding: EdgeInsets.all(12),
  //                 child: Row(
  //                   children: [Column(key), Tooltips()],
  //                 ))),
  //       );
  //     } else if (dataa['$key']['chartType'] == 'bar') {
  //       Barcount.add(key);
  //       Bardata.add(
  //         Card(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15)),
  //             elevation: 10,
  //             color: Colors.grey[200],
  //             child: Padding(
  //                 padding: EdgeInsets.all(12),
  //                 child: Row(
  //                   children: [BarSeies(key), Tooltips()],
  //                 ))),
  //       );
  //     }
  //   });
  //   print('pie: ${piecount.toList()}');
  //   print('Column: ${columncount.toList()}');
  //   print('Bar: ${Barcount.toList()}');
  //   print('doughnut: ${doughnutcount.toList()}');
  //   List<Widget> all = [...piedata, ...Doughnutt, ...Columndata, ...Bardata];
  //   return LayoutBuilder(
  //       builder: (BuildContext ctx, BoxConstraints constraints) {
  //     if (constraints.maxWidth >= 480) {
  //       return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 12),
  //           child: GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 2),
  //               itemCount: all.length,
  //               itemBuilder: ((context, index) {
  //                 return all[index];
  //               })));
  //     } else {
  //       return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 12),
  //           child: ListView(
  //             children: [
  //               Selectedinput == 'CRM'
  //                   ? SingleChildScrollView(
  //                       scrollDirection: Axis.horizontal,
  //                       child: Row(
  //                         children: [
  //                           FlipCardWidet(
  //                             dataa['cardData6']['result'][2].toString(),
  //                             dataa['cardData6']['result'][0].toString(),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           FlipCardWidet(
  //                             dataa['cardData12']['result'][2].toString(),
  //                             dataa['cardData12']['result'][0].toString(),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           FlipCardWidet(
  //                             dataa['cardData13']['result'][2].toString(),
  //                             dataa['cardData13']['result'][0].toString(),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           FlipCardWidet(
  //                             dataa['cardData14']['result'][2].toString(),
  //                             dataa['cardData14']['result'][0].toString(),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           FlipCardWidet(
  //                             dataa['cardData24']['result'][2].toString(),
  //                             dataa['cardData24']['result'][0].toString(),
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   : Container(),
  //               ...piedata,
  //               ...Doughnutt,
  //               ...Columndata,
  //               ...Bardata
  //             ],
  //           ));
  //     }
  //   });
  // }

  // Doughnut(String donutchart) {
  //   List<ChartSampleData> EmployeesCountByWorkExperience = [];
  //   for (int i = 0;
  //       i < dataa['$donutchart']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     EmployeesCountByWorkExperience.add(
  //       ChartSampleData(
  //         x: dataa['$donutchart']['chartLevelsAndValueObj'][i]['X'].toString(),
  //         y: dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'],
  //         text:
  //             ' ${dataa['$donutchart']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'].toString()}',
  //       ),
  //     );
  //   }
  //   return SfCircularChart(
  //     palette:
  //         dataa['$donutchart']['chartTitle'] == 'No.of Positions By Designation'
  //             ? [
  //                 Color(0xff2f6345),
  //                 Color(0xff40875e),
  //                 Color.fromRGBO(75, 135, 185, 1),
  //                 Color.fromRGBO(192, 108, 132, 1),
  //                 Color.fromRGBO(246, 114, 128, 1),
  //                 Color.fromRGBO(248, 177, 149, 1),
  //                 Color.fromRGBO(116, 180, 155, 1),
  //                 Color.fromRGBO(0, 168, 181, 1),
  //                 Color.fromRGBO(73, 76, 162, 1),
  //                 Color.fromRGBO(255, 205, 96, 1),
  //                 Color.fromRGBO(255, 240, 219, 1),
  //                 Color.fromRGBO(238, 238, 238, 1)
  //               ]
  //             : [
  //                 Color(0xff2f6345),
  //                 Color(0xff40875e),
  //               ],
  //     legend: Legend(
  //         isVisible: true,
  //         position: LegendPosition.bottom,
  //         overflowMode: LegendItemOverflowMode.wrap),
  //     title: ChartTitle(
  //         text: '${dataa['$donutchart']['chartTitle']}',
  //         textStyle: TextStyle(fontWeight: FontWeight.bold)),
  //     series: <DoughnutSeries<ChartSampleData, String>>[
  //       DoughnutSeries<ChartSampleData, String>(
  //           explode: true,
  //           explodeIndex: 0,
  //           explodeOffset: '10%',
  //           dataSource: EmployeesCountByWorkExperience,
  //           xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
  //           yValueMapper: (ChartSampleData dataa, _) => dataa.y,
  //           dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
  //           startAngle: 90,
  //           endAngle: 90,
  //           dataLabelSettings: const DataLabelSettings(isVisible: true)),
  //     ],
  //   );
  // }

  // Column(String Coloumnchart) {
  //   List<ChartSampleData> EmployeesCountByAge = [];
  //   for (int i = 0;
  //       i < dataa['$Coloumnchart']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     EmployeesCountByAge.add(
  //       ChartSampleData(
  //         x: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X']
  //             .toString(),
  //         y: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'],
  //         text:
  //             '${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
  //       ),
  //     );
  //   }
  //   return SfCartesianChart(
  //     zoomPanBehavior: ZoomPanBehavior(
  //         enableDoubleTapZooming: true,
  //         enableSelectionZooming: true,
  //         enablePanning: true,
  //         enablePinching: true),
  //     tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
  //     palette: <Color>[
  //       Color(0xff1864b1),
  //     ],
  //     plotAreaBorderWidth: 0,
  //     title: ChartTitle(
  //         text: '${dataa['$Coloumnchart']['chartTitle']}',
  //         textStyle: TextStyle(fontWeight: FontWeight.bold)),
  //     primaryXAxis: CategoryAxis(
  //       isVisible: true,
  //       majorGridLines: const MajorGridLines(width: 1),
  //     ),
  //     primaryYAxis: NumericAxis(
  //         isVisible: true,
  //         axisLine: const AxisLine(width: 1),
  //         labelFormat: '{value}',
  //         majorTickLines: const MajorTickLines(size: 0)),
  //     series: <ColumnSeries<ChartSampleData, String>>[
  //       ColumnSeries<ChartSampleData, String>(
  //         isVisible: true,
  //         dataSource: EmployeesCountByAge,
  //         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
  //         yValueMapper: (ChartSampleData sales, _) => sales.y,
  //         dataLabelSettings: const DataLabelSettings(
  //             isVisible: true, textStyle: TextStyle(fontSize: 10)),
  //       )
  //     ],
  //   );
  // }

  //No.of Positions By Designation
  NoofPositionsByDesignation() {
    List<ChartSampleData> NoofPositionsByDesignation = [];
    for (int i = 0;
        i < dataa['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      NoofPositionsByDesignation.add(
        ChartSampleData(
          x: dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1)
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'No.of Positions By Designation',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: NoofPositionsByDesignation,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

//Employees Count by Work Experience
  EmployeesCountbyWorkExperience() {
    List<ChartSampleData> EmployeesCountbyWorkExperience = [];
    for (int i = 0;
        i < dataa['chartData0']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeesCountbyWorkExperience.add(
        ChartSampleData(
          x: dataa['chartData0']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData0']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1)
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: '${dataa['chartData0']['chartTitle']}',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: EmployeesCountbyWorkExperience,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //No  Of L1 Interviews Taken By Status
  NoOfL1InterviewsTakenByStatus() {
    List<ChartSampleData> NoOfL1InterviewsTakenByStatus = [];
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      NoOfL1InterviewsTakenByStatus.add(
        ChartSampleData(
            x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${(dataa['chartData4']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['chartData4']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color(0xff40875e),
      ],
      title: ChartTitle(text: 'No  Of L1 Interviews Taken By Status'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: NoOfL1InterviewsTakenByStatus,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //No  Of L2 Interviews Taken By Status
  NoOfL2InterviewsTakenByStatus() {
    List<ChartSampleData> NoOfL2InterviewsTakenByStatus = [];
    for (int i = 0;
        i < dataa['chartData5']['chartLevelsAndValueObj'].length;
        i++) {
      NoOfL2InterviewsTakenByStatus.add(
        ChartSampleData(
          x: dataa['chartData5']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData5']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData5']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['chartData5']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color(0xff40875e),
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'No  Of L2 Interviews Taken By Status',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: NoOfL2InterviewsTakenByStatus,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //No. of Profiles Shortlisted by Status
  NoofProfilesShortlistedbyStatus() {
    List<ChartSampleData> NoofProfilesShortlistedbyStatus = [];
    for (int i = 0;
        i < dataa['chartData6']['chartLevelsAndValueObj'].length;
        i++) {
      NoofProfilesShortlistedbyStatus.add(
        ChartSampleData(
          x: dataa['chartData6']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData6']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
      palette: <Color>[
        Color(0xff1864b1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'No. of Profiles Shortlisted by Status',
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
          isVisible: true,
          dataSource: NoofProfilesShortlistedbyStatus,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //No  Of Vacancies By Position
  NoOfVacanciesByPosition() {
    List<ChartSampleData> NoOfVacanciesByPosition = [];
    for (int i = 0;
        i < dataa['chartData7']['chartLevelsAndValueObj'].length;
        i++) {
      NoOfVacanciesByPosition.add(
        ChartSampleData(
            x: dataa['chartData7']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData7']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${(dataa['chartData7']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['chartData7']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
      );
    }
    return SfCircularChart(
      palette: [
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
      ],
      title: ChartTitle(text: 'No  Of Vacancies By Position'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: NoOfVacanciesByPosition,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Employees Count by Blood Group
  EmployeesCountbyBloodGroup() {
    List<ChartSampleData> EmployeesCountbyBloodGroup = [];
    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeesCountbyBloodGroup.add(
        ChartSampleData(
          x: dataa['chartData8']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData8']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
      palette: <Color>[
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
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Employees Count by Blood Group',
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
          isVisible: true,
          dataSource: EmployeesCountbyBloodGroup,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Total Employees Count
  TotalEmployeesCount() {
    List<ChartSampleData> TotalEmployeesCount = [];
    for (int i = 0;
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      TotalEmployeesCount.add(
        ChartSampleData(
            x: dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${(dataa['chartData9']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['chartData9']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
      );
    }
    return SfCircularChart(
      palette: [
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
      ],
      title: ChartTitle(text: 'Total Employees Count'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: TotalEmployeesCount,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Employee Count by Designation
  EmployeeCountbyDesignation() {
    List<ChartSampleData> EmployeeCountbyDesignation = [];
    for (int i = 0;
        i < dataa['chartData10']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeeCountbyDesignation.add(
        ChartSampleData(
            x: dataa['chartData10']['chartLevelsAndValueObj'][i]['X']
                .toString(),
            y: dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${(dataa['chartData10']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['chartData10']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
      );
    }
    return SfCircularChart(
      palette: [
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
      ],
      title: ChartTitle(text: 'Employee Count by Designation'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: EmployeeCountbyDesignation,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  // EmployeesCountbyDepartment() {
  //   List<ChartSampleData> PositionsCountbyLocation = [];
  //   for (int i = 0;
  //       i < dataa['chartData13']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     PositionsCountbyLocation.add(
  //       ChartSampleData(
  //         x: dataa['chartData13']['chartLevelsAndValueObj'][i]['X'],
  //         y: dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'],
  //         text:
  //             '${dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'].toString()}',
  //       ),
  //     );
  //   }

  //   return SfCartesianChart(
  //     tooltipBehavior: PositionsCountbyLocation_tooltipBehavior,
  //     palette: <Color>[
  //       Color(0xff1864b1),
  //     ],
  //     title: ChartTitle(
  //         text: '${dataa['chartData13']['chartTitle']}',
  //         textStyle: TextStyle(fontWeight: FontWeight.bold)),
  //     primaryXAxis: CategoryAxis(
  //       majorGridLines: const MajorGridLines(width: 1),
  //     ),
  //     primaryYAxis: NumericAxis(
  //         minimum: 0,
  //         maximum: 2,
  //         interval: 1,
  //         majorGridLines: const MajorGridLines(width: 1),
  //         majorTickLines: const MajorTickLines(size: 0)),
  //     series: <ChartSeries<ChartSampleData, String>>[
  //       BarSeries<ChartSampleData, String>(
  //         dataLabelSettings: const DataLabelSettings(isVisible: true),
  //         dataSource: PositionsCountbyLocation,
  //         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
  //         yValueMapper: (ChartSampleData sales, _) => sales.y,
  //       )
  //     ],
  //   );
  // }
  // BarSeies(String Bar) {
  //   List<ChartSampleData> PositionsCountbyLocation = [];
  //   for (int i = 0; i < dataa['$Bar']['chartLevelsAndValueObj'].length; i++) {
  //     PositionsCountbyLocation.add(
  //       ChartSampleData(
  //         x: dataa['$Bar']['chartLevelsAndValueObj'][i]['X'],
  //         y: dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'],
  //         text:
  //             '${dataa['$Bar']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'].toString()}',
  //       ),
  //     );
  //   }

  //   return SfCartesianChart(
  //     tooltipBehavior: PositionsCountbyLocation_tooltipBehavior,
  //     palette: <Color>[
  //       Color(0xff1864b1),
  //     ],
  //     title: ChartTitle(
  //         text: '${dataa['$Bar']['chartTitle']}',
  //         textStyle: TextStyle(fontWeight: FontWeight.bold)),
  //     primaryXAxis: CategoryAxis(
  //       majorGridLines: const MajorGridLines(width: 1),
  //     ),
  //     primaryYAxis: NumericAxis(
  //         minimum: 0,
  //         maximum:
  //             dataa['$Bar']['chartTitle'] == 'Employees Count by Department'
  //                 ? 2
  //                 : 90,
  //         interval:
  //             dataa['$Bar']['chartTitle'] == 'Employees Count by Department'
  //                 ? 1
  //                 : 20,
  //         majorGridLines: const MajorGridLines(width: 1),
  //         majorTickLines: const MajorTickLines(size: 0)),
  //     series: <ChartSeries<ChartSampleData, String>>[
  //       BarSeries<ChartSampleData, String>(
  //         dataLabelSettings: const DataLabelSettings(isVisible: true),
  //         dataSource: PositionsCountbyLocation,
  //         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
  //         yValueMapper: (ChartSampleData sales, _) => sales.y,
  //       )
  //     ],
  //   );
  // }
  //Employees Count by Marital Status
  EmployeesCountbyMaritalStatus() {
    List<ChartSampleData> NoOfL2InterviewsTakenByStatus = [];
    for (int i = 0;
        i < dataa['chartData12']['chartLevelsAndValueObj'].length;
        i++) {
      NoOfL2InterviewsTakenByStatus.add(
        ChartSampleData(
          x: dataa['chartData12']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData12']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData12']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['chartData12']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff00acee),
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'Employees Count by Marital Status',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: NoOfL2InterviewsTakenByStatus,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Employees Count by Department
  EmployeesCountbyDepartment() {
    List<ChartSampleData> EmployeesCountbyDepartment = [];
    for (int i = 0;
        i < dataa['chartData13']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeesCountbyDepartment.add(
        ChartSampleData(
          x: dataa['chartData13']['chartLevelsAndValueObj'][i]['X'],
          y: dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }

    return SfCartesianChart(
      tooltipBehavior: PositionsCountbyLocation_tooltipBehavior,
      palette: <Color>[
        Color(0xff1864b1),
      ],
      title: ChartTitle(
          text: 'Employees Count by Department',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 1,
          interval: 0.5,
          majorGridLines: MajorGridLines(width: 1),
          majorTickLines: MajorTickLines(size: 0)),
      series: <ChartSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataLabelSettings: DataLabelSettings(isVisible: true),
          dataSource: EmployeesCountbyDepartment,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        ),
      ],
    );
  }

//Positions Count by Location
  PositionsCountbyLocation() {
    List<ChartSampleData> PositionsCountbyLocation = [];
    for (int i = 0;
        i < dataa['chartData11']['chartLevelsAndValueObj'].length;
        i++) {
      PositionsCountbyLocation.add(
        ChartSampleData(
          x: dataa['chartData11']['chartLevelsAndValueObj'][i]['X'],
          y: dataa['chartData11']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData11']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData11']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }

    return SfCartesianChart(
      tooltipBehavior: PositionsCountbyLocation_tooltipBehavior,
      palette: <Color>[
        Color(0xff1864b1),
      ],
      title: ChartTitle(
          text: '${dataa['chartData11']['chartTitle']}',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 20,
          majorGridLines: MajorGridLines(width: 1),
          majorTickLines: MajorTickLines(size: 0)),
      series: <ChartSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataLabelSettings: DataLabelSettings(isVisible: true),
          dataSource: PositionsCountbyLocation,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        ),
      ],
    );
  }

  //Positions Status
  PositionsStatus() {
    List<ChartSampleData> PositionsStatus = [];
    for (int i = 0;
        i < dataa['chartData15']['chartLevelsAndValueObj'].length;
        i++) {
      PositionsStatus.add(
        ChartSampleData(
          x: dataa['chartData15']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData15']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData15']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData15']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfFunnelChart(
      //   smartLabelMode: SmartLabelMode.none,
      title: ChartTitle(text: 'Positions Status'),
      tooltipBehavior: PositionsStatus_tooltipBehavior,

      /// To enable the legend for funnel chart.
      // legend:
      //     Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),

      series: FunnelSeries<ChartSampleData, String>(
          dataSource: PositionsStatus,
          //   textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
          xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
          yValueMapper: (ChartSampleData dataa, _) => dataa.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside)),
    );
  }

  //Employees Count by Gender
  EmployeesCountbyGender() {
    List<ChartSampleData> EmployeesCountbyGender = [];
    for (int i = 0;
        i < dataa['chartData17']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeesCountbyGender.add(
        ChartSampleData(
          x: dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
      palette: <Color>[
        Color(0xff1864b1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Employees Count by Gender',
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
          isVisible: true,
          dataSource: EmployeesCountbyGender,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

// Employees Count by Age
  EmployeesCountbyAge() {
    List<ChartSampleData> EmployeesCountbyAge = [];
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length;
        i++) {
      EmployeesCountbyAge.add(
        ChartSampleData(
          x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: EmployeesCountByAge_tooltipBehavior,
      palette: <Color>[currentColor],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '${dataa['chartData2']['chartTitle']}',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        name: 'Employees Age',
        isVisible: true,
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          name: 'Count',
          isVisible: true,
          axisLine: const AxisLine(width: 1),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ColumnSeries<ChartSampleData, String>>[
        ColumnSeries<ChartSampleData, String>(
          xAxisName: 'Employees Age',
          yAxisName: 'Count',
          isVisible: true,
          dataSource: EmployeesCountbyAge,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  // Piechart(String chartname) {
  //   List<ChartSampleData> Piechart = [];
  //   for (int i = 0;
  //       i < dataa['$chartname']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     Piechart.add(
  //       ChartSampleData(
  //           x: dataa['$chartname']['chartLevelsAndValueObj'][i]['X'].toString(),
  //           y: dataa['$chartname']['chartLevelsAndValueObj'][i]['Y'],
  //           text:
  //               ' ${(dataa['$chartname']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['$chartname']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
  //     );
  //   }
  //   return SfCircularChart(
  //     palette:
  //         dataa['$chartname']['chartTitle'] == 'No  Of Vacancies By Position '
  //             ? [
  //                 Color(0xff2f6345),
  //                 Color(0xff40875e),
  //                 Color.fromRGBO(75, 135, 185, 1),
  //                 Color.fromRGBO(192, 108, 132, 1),
  //                 Color.fromRGBO(246, 114, 128, 1),
  //                 Color.fromRGBO(248, 177, 149, 1),
  //                 Color.fromRGBO(116, 180, 155, 1),
  //                 Color.fromRGBO(0, 168, 181, 1),
  //                 Color.fromRGBO(73, 76, 162, 1),
  //                 Color.fromRGBO(255, 205, 96, 1),
  //                 Color.fromRGBO(255, 240, 219, 1),
  //                 Color.fromRGBO(238, 238, 238, 1)
  //               ]
  //             : [
  //                 Color(0xff2f6345),
  //                 Color(0xff40875e),
  //               ],
  //     title: ChartTitle(text: '${dataa['$chartname']['chartTitle']}'),
  //     legend: Legend(
  //       isVisible: true,
  //       overflowMode: LegendItemOverflowMode.wrap,
  //       position: LegendPosition.bottom,
  //     ),
  //     series: <PieSeries<ChartSampleData, String>>[
  //       PieSeries<ChartSampleData, String>(
  //           enableTooltip: true,
  //           explode: true,
  //           explodeIndex: 0,
  //           explodeOffset: '10%',
  //           dataSource: Piechart,
  //           xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
  //           yValueMapper: (ChartSampleData dataa, _) => dataa.y,
  //           dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
  //           startAngle: 0,
  //           endAngle: 0,
  //           dataLabelSettings: const DataLabelSettings(isVisible: true)),
  //     ],
  //   );
  // }
}
