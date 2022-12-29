import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/ChartSampleData.dart';
import 'package:integraphics/widgets/ChartSampleData.dart';
import 'package:integraphics/widgets/Flipcard.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'HR_Dashboard.dart';

class CRM_Dashboard extends StatefulWidget {
  const CRM_Dashboard({super.key});

  @override
  State<CRM_Dashboard> createState() => _CRM_DashboardState();
}

class _CRM_DashboardState extends State<CRM_Dashboard> {
  @override
  void initState() {
    print(dataa);
    PipelineOPPProbabilityPCT_tooltipBehavior = TooltipBehavior(
        textAlignment: ChartAlignment.center,
        enable: true,
        canShowMarker: false,
        header: '',
        format: ' point.x\n  point.y ');
    PipelineByCountry_tooltipBehavior =
        TooltipBehavior(enable: true, canShowMarker: false, header: '');
    PipelineByProductandservice_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    RevenueinPipelineByLeadType_tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    RevenueGeneratedbyERP_tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    // TODO: implement initState
    super.initState();
  }

  List<ChartSampleData>? chartData = [];

  TooltipBehavior? PipelineOPPProbabilityPCT_tooltipBehavior;
  TooltipBehavior? RevenueinPipelineByLeadType_tooltipBehavior;
  TooltipBehavior? PipelineByCountry_tooltipBehavior;
  TooltipBehavior? PipelineByProductandservice_tooltipBehavior;
  TooltipBehavior? RevenueGeneratedbyERP_tooltipBehavior;
  var DropdownApidataa;

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

              // Image.asset('assets/images/loader.gif')
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // FlipCardWidet(
                            //   dataa['cardData11']['result'][2],
                            //   dataa['cardData11']['result'][0],
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData12']['result'][2],
                            //   dataa['cardData12']['result'][0],
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData13']['result'][2],
                            //   dataa['cardData13']['result'][0],
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData14']['result'][2],
                            //   dataa['cardData14']['result'][0],
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // FlipCardWidet(
                            //   dataa['cardData24']['result'][2],
                            //   dataa['cardData24']['result'][0],
                            // ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(15)),
                      //   elevation: 10,
                      //   color: Color(0xffe9f2ef),
                      //   child: Padding(
                      //       padding: EdgeInsets.all(12),
                      //       child: Row(
                      //         children: [
                      //           PipelineOPPProbabilityPCT(),
                      //           Tooltips()
                      //         ],
                      //       )),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Color(0xffe9f2ef),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [PipelineValueByStage(), Tooltips()],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Color(0xffe9f2ef),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                PipelineValueBySalesPerson(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Color(0xffe9f2ef),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                AnalysisOfLostOpportunities(),
                                Tooltips(),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Color(0xffe9f2ef),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                PipelineOpportunitiesBySalesPerson(),
                                Tooltips()
                              ],
                            )),
                      ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [NoData1(), Tooltips()],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [LeadsSource(), Tooltips()],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueGeneratedByBusinessType(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueGeneratedByCountry(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueGeneratedbyProductService(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueGeneratedbyIndustry(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             IndustrywiseRevenueinPIpeline(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [RevenueGeneratedbyERP(), Tooltips()],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueGeneratedbyLeadType(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   Card(
                      //     color: Color(0xffe9f2ef),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15)),
                      //     elevation: 10,
                      //     child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Row(
                      //           children: [
                      //             RevenueinPipelineByLeadType(),
                      //             Tooltips()
                      //           ],
                      //         )),
                      //   ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text('Empty dataa');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  // Future<dynamic> chartDataAPi() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = json.encode({"dashbordname": "CRM"});
  //   var response = await post(
  //     Uri.parse('http://192.169.1.211:8080/smartBi/smartIntBi/getChartCards'),
  //     headers: headers,
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       DropdownApidataa = response.body;
  //       dataa = jsonDecode(response.body);
  //     });

  //     // print(dataa);
  //     print(dataa['chartData15']['chartLevelsAndValueObj'][0]['X'].toString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   return dataa;
  // }

//Pipeline Value By Sales Person
  PipelineValueBySalesPerson() {
    List<ChartSampleData> apple = [];
    for (int i = 0;
        i < dataa['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      apple.add(
        ChartSampleData(
          x: dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'Pipeline Value By Sales Person',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: apple,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Pipeline By Country
//   PipelineByCountry() {
//     List<ChartSampleData> PipelineByCountry = [];
//     for (int i = 0;
//         i < dataa['chartData3']['chartLevelsAndValueObj'].length;
//         i++) {
//       PipelineByCountry.add(
//         ChartSampleData(
//           x: dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
//         ),
//       );
//     }

//     return SfCartesianChart(
//       tooltipBehavior: PipelineByCountry_tooltipBehavior,
//       palette: <Color>[
//         Colors.red,
//         Color.fromRGBO(75, 135, 185, 1),
//         Color.fromRGBO(192, 108, 132, 1),
//         Color.fromRGBO(246, 114, 128, 1),
//         Color.fromRGBO(248, 177, 149, 1),
//         Color.fromRGBO(246, 114, 128, 1),
//         Color.fromRGBO(248, 177, 149, 1),
//       ],
//       title: ChartTitle(
//           text: 'Pipeline By Country',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       primaryXAxis: CategoryAxis(
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       primaryYAxis: NumericAxis(
//           minimum: 0,
//           maximum: 6,
//           interval: 2,
//           majorGridLines: const MajorGridLines(width: 1),
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: <ChartSeries<ChartSampleData, String>>[
//         BarSeries<ChartSampleData, String>(
//           dataLabelSettings: const DataLabelSettings(isVisible: true),
//           dataSource: PipelineByCountry,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//           yValueMapper: (ChartSampleData sales, _) => sales.y,
//         )
//       ],
//     );
//   }

//   //Pipeline By Product and service
//   // PipelineByProductandservice() {
//   //   List<ChartSampleData> PipelineByProductandservice = [];
//   //   for (int i = 0;
//   //       i < dataa['chartData4']['chartLevelsAndValueObj'].length;
//   //       i++) {
//   //     PipelineByProductandservice.add(
//   //       ChartSampleData(
//   //         x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
//   //         y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
//   //         text:
//   //             '${dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
//   //       ),
//   //     );
//   //   }
//   //   return SfCartesianChart(
//   //     tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
//   //     palette: <Color>[
//   //       Color.fromRGBO(0, 168, 181, 1),
//   //     ],
//   //     plotAreaBorderWidth: 0,
//   //     title: ChartTitle(
//   //         text: 'Pipeline By Product and service',
//   //         textStyle: TextStyle(fontWeight: FontWeight.bold)),
//   //     primaryXAxis: CategoryAxis(
//   //       labelRotation: 35,
//   //       labelsExtent: 50,
//   //       majorGridLines: const MajorGridLines(width: 1),
//   //     ),
//   //     primaryYAxis: NumericAxis(
//   //         axisLine: const AxisLine(width: 1),
//   //         labelFormat: '{value}',
//   //         majorTickLines: const MajorTickLines(size: 0)),
//   //     series: <ColumnSeries<ChartSampleData, String>>[
//   //       ColumnSeries<ChartSampleData, String>(
//   //         dataSource: PipelineByProductandservice,
//   //         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//   //         yValueMapper: (ChartSampleData sales, _) => sales.y,
//   //         dataLabelSettings: const DataLabelSettings(
//   //             isVisible: true, textStyle: TextStyle(fontSize: 10)),
//   //       )
//   //     ],
//   //   );
//   // }

//   //Revenue in Pipeline By Lead Type
//   RevenueinPipelineByLeadType() {
//     List<ChartSampleData> RevenueinPipelineByLeadTypee = [];
//     for (int i = 0;
//         i < dataa['chartData25']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueinPipelineByLeadTypee.add(
//         ChartSampleData(
//           x: dataa['chartData25']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData25']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData25']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData25']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
//         ),
//       );
//     }
//     return SfFunnelChart(
//       //   smartLabelMode: SmartLabelMode.none,
//       title: ChartTitle(text: 'Revenue in Pipeline By Lead Type'),
      // tooltipBehavior: RevenueinPipelineByLeadType_tooltipBehavior,

//       /// To enable the legend for funnel chart.
//       // legend:
//       //     Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),

//       series: FunnelSeries<ChartSampleData, String>(
//           dataSource: RevenueinPipelineByLeadTypee,
//           //   textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
//           xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//           yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//           dataLabelSettings: DataLabelSettings(
//               isVisible: true, labelPosition: ChartDataLabelPosition.inside)),
//     );
//   }
//   //Pipeline OPP Probability PCT

//   // PipelineOPPProbabilityPCT() {
//   //   List<ChartSampleData> PipelineOPPProbabilityPCT = [];
//   //   for (int i = 0;
//   //       i < dataa['chartData2']['chartLevelsAndValueObj'].length;
//   //       i++) {
//   //     PipelineOPPProbabilityPCT.add(
//   //       ChartSampleData(
//   //           x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
//   //           y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
//   //           size: 0.37,
//   //           pointColor: Colors.orange[800]),
//   //     );
//   //   }
//   //   return SfCartesianChart(
//   //     tooltipBehavior: PipelineOPPProbabilityPCT_tooltipBehavior,
//   //     title: ChartTitle(text: 'Pipeline OPP Probability PCT'),
//   //     plotAreaBorderWidth: 0,
//   //     primaryXAxis: CategoryAxis(
//   //         majorGridLines: const MajorGridLines(width: 0),
//   //         labelIntersectAction: AxisLabelIntersectAction.rotate45),
//   //     primaryYAxis: NumericAxis(
//   //         axisLine: const AxisLine(width: 0),
//   //         minimum: 0,
//   //         maximum: 100,
//   //         rangePadding: ChartRangePadding.additional,
//   //         majorTickLines: const MajorTickLines(size: 0)),
//   //     series: <BubbleSeries<ChartSampleData, String>>[
//   //       BubbleSeries<ChartSampleData, String>(
//   //         dataSource: PipelineOPPProbabilityPCT,
//   //         opacity: 0.8,
//   //         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//   //         yValueMapper: (ChartSampleData sales, _) => sales.y,
//   //         maximumRadius: 2,

//   //         /// It helps to render a bubble series as various colors,
//   //         /// which is given by user from dataa soruce.
//   //         pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
//   //         sizeValueMapper: (ChartSampleData sales, _) => 2,
//   //       )
//   //     ],
//   //     // tooltipBehavior: _tooltipBehavior,
//   //   );
//   // }

  //Pipeline Value By Stage
  PipelineValueByStage() {
    List<ChartSampleData> PipelineValueByStage = [];
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineValueByStage.add(
        ChartSampleData(
          x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
      ],
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      title: ChartTitle(
          text: 'Pipeline Value By Stage',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: PipelineValueByStage,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Analysis Of Lost Opportunities
  AnalysisOfLostOpportunities() {
    List<ChartSampleData> AnalysisOfLostOpportunities = [];
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      AnalysisOfLostOpportunities.add(
        ChartSampleData(
          x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCircularChart(
      palette: [
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
      ],
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      title: ChartTitle(
          text: 'Analysis Of Lost Opportunities',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: AnalysisOfLostOpportunities,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Pipeline Opportunities By Sales Person
  PipelineOpportunitiesBySalesPerson() {
    List<ChartSampleData> PipelineOpportunitiesBySalesPerson = [];
    for (int i = 0;
        i < dataa['chartData10']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineOpportunitiesBySalesPerson.add(
        ChartSampleData(
          x: dataa['chartData10']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData10']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(73, 76, 162, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Pipeline By Product and service',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelRotation: 35,
        labelsExtent: 50,
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 1),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ColumnSeries<ChartSampleData, String>>[
        ColumnSeries<ChartSampleData, String>(
          dataSource: PipelineOpportunitiesBySalesPerson,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

//   //Leads Source

//   LeadsSource() {
//     List<ChartSampleData> LeadsSource = [];
//     for (int i = 0;
//         i < dataa['chartData13']['chartLevelsAndValueObj'].length;
//         i++) {
//       LeadsSource.add(
//         ChartSampleData(
//           x: dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
//         ),
//       );
//     }
//     return SfCartesianChart(
//       tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
//       palette: <Color>[
//         Color.fromRGBO(246, 114, 128, 1),
//       ],
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(
//           text: 'Lead Source',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       primaryXAxis: CategoryAxis(
//         labelRotation: 35,
//         labelsExtent: 50,
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       primaryYAxis: NumericAxis(
//           axisLine: const AxisLine(width: 1),
//           labelFormat: '{value}',
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: <ColumnSeries<ChartSampleData, String>>[
//         ColumnSeries<ChartSampleData, String>(
//           dataSource: LeadsSource,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//           yValueMapper: (ChartSampleData sales, _) => sales.y,
//           dataLabelSettings: const DataLabelSettings(
//               isVisible: true, textStyle: TextStyle(fontSize: 10)),
//         )
//       ],
//     );
//   }

// //No Data1
//   NoData1() {
//     List<ChartSampleData> RevenueGeneratedByBusinessType = [];
//     for (int i = 0;
//         i < dataa['chartData11']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedByBusinessType.add(
//         ChartSampleData(
//             x: dataa['chartData11']['chartLevelsAndValueObj'][i]['X']
//                 .toString(),
//             y: dataa['chartData11']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${(dataa['chartData11']['chartLevelsAndValueObj'][i]['X']).toString()}'),
//       );
//     }
//     return SfCircularChart(
//       palette: [
//         Color(0xff2f6345),
//         Color(0xff40875e),
//         Color(0xff58b07e),
//         Color(0xffc48c00),
//         Color(0xfff0ab00),
//         Color(0xffc6910f),
//         Color(0xffdeb449),
//         Color(0xffffcc4b),
//         Color(0xff827e32),
//         Color(0xffa8a240),
//         Color(0xffc5c169)
//       ],
//       title: ChartTitle(text: '${dataa['chartData11']['chartTitle']}'),
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       series: <PieSeries<ChartSampleData, String>>[
//         PieSeries<ChartSampleData, String>(
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '10%',
//             dataSource: RevenueGeneratedByBusinessType,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 0,
//             endAngle: 0,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

//   //Revenue Generated By Business Type
//   RevenueGeneratedByBusinessType() {
//     num total = 0;
//     for (int i = 0;
//         i < dataa['chartData14']['chartLevelsAndValueObj'].length;
//         i++) {
//       if (dataa['chartData14']['chartLevelsAndValueObj'][i]['Y'] == null) {
//         i++;
//       } else
//         total = total + dataa['chartData14']['chartLevelsAndValueObj'][i]['Y'];
//     }
//     print(total);
//     List<ChartSampleData> RevenueGeneratedByBusinessType = [];
//     for (int i = 0;
//         i < dataa['chartData14']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedByBusinessType.add(
//         ChartSampleData(
//             x: dataa['chartData14']['chartLevelsAndValueObj'][i]['X']
//                 .toString(),
//             y: dataa['chartData14']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${((dataa['chartData14']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
//       );
//     }
//     return SfCircularChart(
//       palette: [
//         Color(0xff2f6345),
//         Color(0xff40875e),
//       ],
//       title: ChartTitle(text: '${dataa['chartData14']['chartTitle']}'),
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       series: <PieSeries<ChartSampleData, String>>[
//         PieSeries<ChartSampleData, String>(
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '10%',
//             dataSource: RevenueGeneratedByBusinessType,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 0,
//             endAngle: 0,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

//   //Revenue Generated By Country
//   RevenueGeneratedByCountry() {
//     List<ChartSampleData> RevenueGeneratedByCountry = [];
//     for (int i = 0;
//         i < dataa['chartData17']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedByCountry.add(
//         ChartSampleData(
//           x: dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'].toString()}',
//         ),
//       );
//     }
//     return SfCartesianChart(
//       tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
//       palette: <Color>[
//         Color.fromRGBO(246, 114, 128, 1),
//       ],
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(
//           text: '${dataa['chartData17']['chartTitle']}',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       primaryXAxis: CategoryAxis(
//         labelRotation: 35,
//         labelsExtent: 50,
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       primaryYAxis: NumericAxis(
//           axisLine: const AxisLine(width: 1),
//           labelFormat: '{value}',
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: <ColumnSeries<ChartSampleData, String>>[
//         ColumnSeries<ChartSampleData, String>(
//           dataSource: RevenueGeneratedByCountry,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//           yValueMapper: (ChartSampleData sales, _) => sales.y,
//           dataLabelSettings: const DataLabelSettings(
//               isVisible: true, textStyle: TextStyle(fontSize: 10)),
//         )
//       ],
//     );
//   }

//   //Revenue Generated by Product/Service
//   RevenueGeneratedbyProductService() {
//     List<ChartSampleData> RevenueGeneratedByCountry = [];
//     for (int i = 0;
//         i < dataa['chartData18']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedByCountry.add(
//         ChartSampleData(
//           x: dataa['chartData18']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData18']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData18']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData18']['chartLevelsAndValueObj'][i]['Y'].toString()}',
//         ),
//       );
//     }
//     return SfCartesianChart(
//       tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
//       palette: <Color>[
//         Color.fromARGB(255, 29, 34, 186),
//       ],
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(
//           text: '${dataa['chartData18']['chartTitle']}',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       primaryXAxis: CategoryAxis(
//         labelRotation: 35,
//         labelsExtent: 50,
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       primaryYAxis: NumericAxis(
//           axisLine: const AxisLine(width: 1),
//           labelFormat: '{value}',
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: <ColumnSeries<ChartSampleData, String>>[
//         ColumnSeries<ChartSampleData, String>(
//           dataSource: RevenueGeneratedByCountry,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//           yValueMapper: (ChartSampleData sales, _) => sales.y,
//           dataLabelSettings: const DataLabelSettings(
//               isVisible: true, textStyle: TextStyle(fontSize: 10)),
//         )
//       ],
//     );
//   }

//   //Revenue Generated by Industry
//   RevenueGeneratedbyIndustry() {
//     num total = 0;
//     for (int i = 0;
//         i < dataa['chartData19']['chartLevelsAndValueObj'].length;
//         i++) {
//       if (dataa['chartData19']['chartLevelsAndValueObj'][i]['Y'] == null) {
//         i++;
//       } else
//         total = total + dataa['chartData19']['chartLevelsAndValueObj'][i]['Y'];
//     }
//     print(total);
//     List<ChartSampleData> RevenueGeneratedbyIndustry = [];
//     for (int i = 0;
//         i < dataa['chartData19']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedbyIndustry.add(
//         ChartSampleData(
//             x: dataa['chartData19']['chartLevelsAndValueObj'][i]['X']
//                 .toString(),
//             y: dataa['chartData19']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${((dataa['chartData19']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
//       );
//     }
//     return SfCircularChart(
//       palette: [
//         Color(0xff2f6345),
//         Color(0xff40875e),
//         Color(0xff58b07e),
//         Color(0xffc48c00),
//         Color(0xfff0ab00),
//         Color(0xffc6910f),
//         Color(0xffdeb449),
//         Color(0xffffcc4b),
//         Color(0xff827e32),
//         Color(0xffa8a240),
//         Color(0xffc5c169)
//       ],
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       title: ChartTitle(
//           text: '${dataa['chartData19']['chartTitle']}',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       series: <DoughnutSeries<ChartSampleData, String>>[
//         DoughnutSeries<ChartSampleData, String>(
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '10%',
//             dataSource: RevenueGeneratedbyIndustry,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 90,
//             endAngle: 90,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

//   //Industry wise Revenue in PIpeline
//   IndustrywiseRevenueinPIpeline() {
//     num total = 0;
//     for (int i = 0;
//         i < dataa['chartData21']['chartLevelsAndValueObj'].length;
//         i++) {
//       if (dataa['chartData21']['chartLevelsAndValueObj'][i]['Y'] == null) {
//         i++;
//       } else
//         total = total + dataa['chartData21']['chartLevelsAndValueObj'][i]['Y'];
//     }
//     print(total);
//     List<ChartSampleData> IndustrywiseRevenueinPIpeline = [];
//     for (int i = 0;
//         i < dataa['chartData21']['chartLevelsAndValueObj'].length;
//         i++) {
//       IndustrywiseRevenueinPIpeline.add(
//         ChartSampleData(
//             x: dataa['chartData21']['chartLevelsAndValueObj'][i]['X']
//                 .toString(),
//             y: dataa['chartData21']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${((dataa['chartData21']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
//       );
//     }
//     return SfCircularChart(
//       palette: [
//         Color(0xff2f6345),
//         Color(0xff40875e),
//         Color.fromARGB(255, 81, 150, 110),
//       ],
//       title: ChartTitle(text: '${dataa['chartData21']['chartTitle']}'),
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       series: <PieSeries<ChartSampleData, String>>[
//         PieSeries<ChartSampleData, String>(
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '10%',
//             dataSource: IndustrywiseRevenueinPIpeline,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 0,
//             endAngle: 0,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

//   //Revenue Generated by ERP
//   RevenueGeneratedbyERP() {
//     List<ChartSampleData> PositionsStatus = [];
//     for (int i = 0;
//         i < dataa['chartData22']['chartLevelsAndValueObj'].length;
//         i++) {
//       PositionsStatus.add(
//         ChartSampleData(
//           x: dataa['chartData22']['chartLevelsAndValueObj'][i]['X'].toString(),
//           y: dataa['chartData22']['chartLevelsAndValueObj'][i]['Y'],
//           text:
//               '${dataa['chartData22']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData22']['chartLevelsAndValueObj'][i]['Y'].toString()}',
//         ),
//       );
//     }
//     return SfFunnelChart(
//       //   smartLabelMode: SmartLabelMode.none,
//       title: ChartTitle(text: 'Positions Status'),
//       tooltipBehavior: RevenueGeneratedbyERP_tooltipBehavior,

//       /// To enable the legend for funnel chart.
//       legend:
//           Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),

//       series: FunnelSeries<ChartSampleData, String>(
//           dataSource: PositionsStatus,
//           //   textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
//           xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//           yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//           dataLabelSettings: DataLabelSettings(
//               isVisible: true, labelPosition: ChartDataLabelPosition.outside)),
//     );
//   }

//   //Revenue Generated by Lead Type
//   RevenueGeneratedbyLeadType() {
//     num total = 0;
//     for (int i = 0;
//         i < dataa['chartData24']['chartLevelsAndValueObj'].length;
//         i++) {
//       if (dataa['chartData24']['chartLevelsAndValueObj'][i]['Y'] == null) {
//         i++;
//       } else
//         total = total + dataa['chartData24']['chartLevelsAndValueObj'][i]['Y'];
//     }
//     print(total);
//     List<ChartSampleData> RevenueGeneratedbyLeadType = [];
//     for (int i = 0;
//         i < dataa['chartData24']['chartLevelsAndValueObj'].length;
//         i++) {
//       RevenueGeneratedbyLeadType.add(
//         ChartSampleData(
//             x: dataa['chartData24']['chartLevelsAndValueObj'][i]['X']
//                 .toString(),
//             y: dataa['chartData24']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${((dataa['chartData24']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
//       );
//     }
//     return SfCircularChart(
//       palette: [
//         Color(0xff2f6345),
//         Color(0xff40875e),
//         Color(0xff58b07e),
//         Color(0xffc48c00),
//         Color(0xfff0ab00),
//         Color(0xffc6910f),
//         Color(0xffdeb449),
//         Color(0xffffcc4b),
//         Color(0xff827e32),
//         Color(0xffa8a240),
//         Color(0xffc5c169)
//       ],
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       title: ChartTitle(
//           text: '${dataa['chartData24']['chartTitle']}',
//           textStyle: TextStyle(fontWeight: FontWeight.bold)),
//       series: <DoughnutSeries<ChartSampleData, String>>[
//         DoughnutSeries<ChartSampleData, String>(
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '10%',
//             dataSource: RevenueGeneratedbyLeadType,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 90,
//             endAngle: 90,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

  //
}
