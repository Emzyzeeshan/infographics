import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'APC_Rehan.dart';

class HR_DashBoard extends StatefulWidget {
  const HR_DashBoard({super.key});

  @override
  State<HR_DashBoard> createState() => _HR_DashBoardState();
}

class _HR_DashBoardState extends State<HR_DashBoard> {
  @override
  void initState() {
    // ChartdataAPi();_tooltipBehavior =
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
  var DropdownApidata;
  var data;
  late Future<dynamic> _value = ChartdataAPi();
  @override
  Widget build(BuildContext context) {
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
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Future<dynamic> ChartdataAPi() async {
    await Future.delayed(Duration(seconds: 1));
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"dashbordname": "CRM"});
    var response = await post(
      Uri.parse('http://192.169.1.211:8080/smartBi/smartIntBi/getChartCards'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      setState(() {
        DropdownApidata = response.body;
        data = jsonDecode(response.body);
      });

      // print(data);
      print(data['chartData15']['chartLevelsAndValueObj'][0]['X'].toString());
    } else {
      print(response.reasonPhrase);
    }
    return data;
  }

//Pipeline Value By Sales Person
  PipelineValueBySalesPerson() {
    List<ChartSampleData> apple = [];
    for (int i = 0;
        i < data['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      apple.add(
        ChartSampleData(
          x: data['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData9']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${data['chartData9']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelMapper: (ChartSampleData data, _) => data.text,
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
        i < data['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineByCountry.add(
        ChartSampleData(
          x: data['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData3']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${data['chartData3']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${data['chartData3']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
        i < data['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineByProductandservice.add(
        ChartSampleData(
          x: data['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData4']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${data['chartData4']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${data['chartData4']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
        i < data['chartData29']['chartLevelsAndValueObj'].length;
        i++) {
      RevenueinPipelineByLeadTypee.add(
        ChartSampleData(
          x: data['chartData29']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData29']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${data['chartData29']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${data['chartData29']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
          //   textFieldMapper: (ChartSampleData data, _) => data.text,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.inside)),
    );
  }
  //Pipeline OPP Probability PCT

  PipelineOPPProbabilityPCT() {
    List<ChartSampleData> PipelineOPPProbabilityPCT = [];
    for (int i = 0;
        i < data['chartData7']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineOPPProbabilityPCT.add(
        ChartSampleData(
            x: data['chartData7']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: data['chartData7']['chartLevelsAndValueObj'][i]['Y'],
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
          /// which is given by user from data soruce.
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
        i < data['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineValueByStage.add(
        ChartSampleData(
          x: data['chartData8']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData8']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${data['chartData8']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelMapper: (ChartSampleData data, _) => data.text,
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
        i < data['chartData10']['chartLevelsAndValueObj'].length;
        i++) {
      AnalysisOfLostOpportunities.add(
        ChartSampleData(
          x: data['chartData10']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData10']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${data['chartData10']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelMapper: (ChartSampleData data, _) => data.text,
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
        i < data['chartData15']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineOpportunitiesBySalesPerson.add(
        ChartSampleData(
          x: data['chartData15']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData15']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${data['chartData15']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${data['chartData15']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
        i < data['chartData17']['chartLevelsAndValueObj'].length;
        i++) {
      LeadsSource.add(
        ChartSampleData(
          x: data['chartData17']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: data['chartData17']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${data['chartData17']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${data['chartData17']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
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
