import 'dart:convert';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/ChartSampleData.dart';
import 'package:integraphics/widgets/ChartSampleData.dart';
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
    // TODO: implement initState
    super.initState();
  }

  List<ChartSampleData>? chartData = [];

  TooltipBehavior? PipelineOPPProbabilityPCT_tooltipBehavior;
  TooltipBehavior? RevenueinPipelineByLeadType_tooltipBehavior;
  TooltipBehavior? PipelineByCountry_tooltipBehavior;
  TooltipBehavior? PipelineByProductandservice_tooltipBehavior;
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
            return Center(child: CircularProgressIndicator());
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
                                PipelineValueBySalesPerson(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [PipelineByCountry(), Tooltips()],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                PipelineByProductandservice(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                RevenueinPipelineByLeadType(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                PipelineOPPProbabilityPCT(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [PipelineValueByStage(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                AnalysisOfLostOpportunities(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
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
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [LeadsSource(), Tooltips()],
                            )),
                      ),
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
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      apple.add(
        ChartSampleData(
          x: dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
  PipelineByCountry() {
    List<ChartSampleData> PipelineByCountry = [];
    for (int i = 0;
        i < dataa['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineByCountry.add(
        ChartSampleData(
          x: dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }

    return SfCartesianChart(
      tooltipBehavior: PipelineByCountry_tooltipBehavior,
      palette: <Color>[
        Colors.red,
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
      ],
      title: ChartTitle(
          text: 'Pipeline By Country',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 6,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 1),
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ChartSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: PipelineByCountry,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        )
      ],
    );
  }

  //Pipeline By Product and service
  PipelineByProductandservice() {
    List<ChartSampleData> PipelineByProductandservice = [];
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineByProductandservice.add(
        ChartSampleData(
          x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(0, 168, 181, 1),
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
          dataSource: PipelineByProductandservice,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Revenue in Pipeline By Lead Type
  RevenueinPipelineByLeadType() {
    List<ChartSampleData> RevenueinPipelineByLeadTypee = [];
    for (int i = 0;
        i < dataa['chartData29']['chartLevelsAndValueObj'].length;
        i++) {
      RevenueinPipelineByLeadTypee.add(
        ChartSampleData(
          x: dataa['chartData29']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData29']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData29']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData29']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfFunnelChart(
      //   smartLabelMode: SmartLabelMode.none,
      title: ChartTitle(text: 'Revenue in Pipeline By Lead Type'),
      tooltipBehavior: RevenueinPipelineByLeadType_tooltipBehavior,

      /// To enable the legend for funnel chart.
      // legend:
      //     Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),

      series: FunnelSeries<ChartSampleData, String>(
          dataSource: RevenueinPipelineByLeadTypee,
          //   textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
          xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
          yValueMapper: (ChartSampleData dataa, _) => dataa.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.inside)),
    );
  }
  //Pipeline OPP Probability PCT

  PipelineOPPProbabilityPCT() {
    List<ChartSampleData> PipelineOPPProbabilityPCT = [];
    for (int i = 0;
        i < dataa['chartData7']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineOPPProbabilityPCT.add(
        ChartSampleData(
            x: dataa['chartData7']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData7']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.orange[800]),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: PipelineOPPProbabilityPCT_tooltipBehavior,
      title: ChartTitle(text: 'Pipeline OPP Probability PCT'),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.rotate45),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          minimum: 0,
          maximum: 100,
          rangePadding: ChartRangePadding.additional,
          majorTickLines: const MajorTickLines(size: 0)),
      series: <BubbleSeries<ChartSampleData, String>>[
        BubbleSeries<ChartSampleData, String>(
          dataSource: PipelineOPPProbabilityPCT,
          opacity: 0.8,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          maximumRadius: 2,

          /// It helps to render a bubble series as various colors,
          /// which is given by user from dataa soruce.
          pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
          sizeValueMapper: (ChartSampleData sales, _) => 2,
        )
      ],
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  //Pipeline Value By Stage
  PipelineValueByStage() {
    List<ChartSampleData> PipelineValueByStage = [];
    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineValueByStage.add(
        ChartSampleData(
          x: dataa['chartData8']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
        i < dataa['chartData10']['chartLevelsAndValueObj'].length;
        i++) {
      AnalysisOfLostOpportunities.add(
        ChartSampleData(
          x: dataa['chartData10']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
        i < dataa['chartData15']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineOpportunitiesBySalesPerson.add(
        ChartSampleData(
          x: dataa['chartData15']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData15']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData15']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData15']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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

  //Leads Source

  LeadsSource() {
    List<ChartSampleData> LeadsSource = [];
    for (int i = 0;
        i < dataa['chartData17']['chartLevelsAndValueObj'].length;
        i++) {
      LeadsSource.add(
        ChartSampleData(
          x: dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData17']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData17']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: PipelineByProductandservice_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(246, 114, 128, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Lead Source',
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
          dataSource: LeadsSource,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }
}
