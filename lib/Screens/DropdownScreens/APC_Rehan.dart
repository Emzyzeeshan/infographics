import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:integraphics/Logout/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Infographics.dart';

class Apc_Rehan_Widget extends StatefulWidget {
  @override
  State<Apc_Rehan_Widget> createState() => _Apc_Rehan_WidgetState();
}

class _Apc_Rehan_WidgetState extends State<Apc_Rehan_Widget> {
  late double _columnWidth;
  late double _columnSpacing;
  List<ChartSampleData>? chartData;
  TooltipBehavior? _tooltipBehavior;
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
  ];
  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Norway', y: 16, secondSeriesYValue: 8, thirdSeriesYValue: 13),
      ChartSampleData(
          x: 'USA', y: 8, secondSeriesYValue: 10, thirdSeriesYValue: 7),
      ChartSampleData(
          x: 'Germany', y: 12, secondSeriesYValue: 10, thirdSeriesYValue: 5),
      ChartSampleData(
          x: 'Canada', y: 4, secondSeriesYValue: 8, thirdSeriesYValue: 14),
      ChartSampleData(
          x: 'Netherlands', y: 8, secondSeriesYValue: 5, thirdSeriesYValue: 4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              child: Column(children: [
                //Initialize the chart widget
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  // color: Colors.green[200],
                  elevation: 10,
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(
                          text:
                              'Half yearly sales analysis\n--------------------------------------------------------------'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SalesData, String>>[
                        LineSeries<_SalesData, String>(
                            dataSource: data,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),

                /* Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )*/
                Card(
                  child: SfCircularChart(
                    title: ChartTitle(text: 'Half yearly sales analysis2'),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <PieSeries<ChartSampleData, String>>[
                      PieSeries<ChartSampleData, String>(
                          dataSource: <ChartSampleData>[
                            ChartSampleData(
                                x: 'Argentina', y: 505370, text: '45%'),
                            ChartSampleData(
                                x: 'Belgium', y: 551500, text: '53.7%'),
                            ChartSampleData(
                                x: 'Cuba', y: 312685, text: '59.6%'),
                            ChartSampleData(
                                x: 'Dominican Republic',
                                y: 350000,
                                text: '72.5%'),
                            ChartSampleData(
                                x: 'Egypt', y: 301000, text: '85.8%'),
                            ChartSampleData(
                                x: 'Kazakhstan', y: 300000, text: '90.5%'),
                            ChartSampleData(
                                x: 'Somalia', y: 357022, text: '95.6%')
                          ],
                          xValueMapper: (ChartSampleData data, _) =>
                              data.x as String,
                          yValueMapper: (ChartSampleData data, _) => data.y,
                          dataLabelMapper: (ChartSampleData data, _) =>
                              data.x as String,
                          startAngle: 100,
                          endAngle: 100,
                          pointRadiusMapper: (ChartSampleData data, _) =>
                              data.text,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.outside))
                    ],
                  ),
                ),
                Card(
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    title:
                        ChartTitle(text: 'Winter olympic medals count - 2022'),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                        maximum: 20,
                        minimum: 0,
                        interval: 4,
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(size: 0)),
                    series: _getDefaultColumn(),
                    //legend: Legend(isVisible: !isCardView),
                    tooltipBehavior: _tooltipBehavior,
                  ),
                )
              ]))),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumn() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(

          /// To apply the column width here.
          //width: isCardView ? 0.8 : _columnWidth,

          /// To apply the spacing betweeen to two columns here.
          //spacing: isCardView ? 0.2 : _columnSpacing,
          dataSource: chartData!,
          color: const Color.fromRGBO(251, 193, 55, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Gold'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          //width: isCardView ? 0.8 : _columnWidth,
          // spacing: isCardView ? 0.2 : _columnSpacing,
          color: const Color.fromRGBO(177, 183, 188, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Silver'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData!,
          //width: isCardView ? 0.8 : _columnWidth,
          //spacing: isCardView ? 0.2 : _columnSpacing,
          color: const Color.fromRGBO(140, 92, 69, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Bronze')
    ];
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
