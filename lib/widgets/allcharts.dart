import 'package:flutter/material.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/radarchart.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'ChartSampleData.dart';

PiechartConvert(String chartname) {
  List<ChartSampleData> Piechart = [];
  for (int i = 0;
      i < dataa['$chartname']['chartLevelsAndValueObj'].length;
      i++) {
    Piechart.add(
      ChartSampleData(
          x: dataa['$chartname']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['$chartname']['chartLevelsAndValueObj'][i]['Y'],
          text:
              ' ${(dataa['$chartname']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['$chartname']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
    );
  }
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: SfCircularChart(
      title: ChartTitle(text: '${dataa['$chartname']['chartTitle']}'),
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
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    ),
  );
}

DoughnutConvert(String donutchart) {
  List<ChartSampleData> EmployeesCountByWorkExperience = [];
  for (int i = 0;
      i < dataa['$donutchart']['chartLevelsAndValueObj'].length;
      i++) {
    EmployeesCountByWorkExperience.add(
      ChartSampleData(
        x: dataa['$donutchart']['chartLevelsAndValueObj'][i]['X'].toString(),
        y: dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'],
        text:
            ' ${dataa['$donutchart']['chartLevelsAndValueObj'][i]['X'].toString()}\n${dataa['$donutchart']['chartLevelsAndValueObj'][i]['Y'].toString()}',
      ),
    );
  }
  return Card(
    child: SfCircularChart(
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
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    ),
  );
}

TooltipBehavior ColumnConvert_tooltipBehavior = TooltipBehavior();
ColumnConvert(String Coloumnchart) {
  List<ChartSampleData> EmployeesCountByAge = [];
  for (int i = 0;
      i < dataa['$Coloumnchart']['chartLevelsAndValueObj'].length;
      i++) {
    EmployeesCountByAge.add(
      ChartSampleData(
        x: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X'].toString(),
        y: dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'],
        text:
            '${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Coloumnchart']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
      ),
    );
  }
  return Card(
    child: SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: ColumnConvert_tooltipBehavior,
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
          isVisible: true,
          dataSource: EmployeesCountByAge,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    ),
  );
}

//bar
TooltipBehavior BarSeiesConvert_tooltipBehavior = TooltipBehavior();
BarSeiesConvert(String Bar) {
  List<ChartSampleData> PositionsCountbyLocation = [];
  List sort = [];
  for (int i = 0; i < dataa['$Bar']['chartLevelsAndValueObj'].length; i++) {
    PositionsCountbyLocation.add(
      ChartSampleData(
        x: dataa['$Bar']['chartLevelsAndValueObj'][i]['X'],
        y: dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'],
        text:
            '${dataa['$Bar']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Bar']['chartLevelsAndValueObj'][i]['Y'].toString()}',
      ),
    );
    sort.add(dataa['$Bar']['chartLevelsAndValueObj'][i]['Y']);
  }
  print(sort.reduce((curr, next) => curr > next ? curr : next) + .0);
  print(sort.reduce((curr, next) => curr < next ? curr : next) + .0);
  double max = sort.reduce((curr, next) => curr > next ? curr : next) + .0;
  double min = sort.reduce((curr, next) => curr < next ? curr : next) + .0;
  return Card(
    child: SfCartesianChart(
      tooltipBehavior: BarSeiesConvert_tooltipBehavior,
      // palette: AllBarcolorlist[Barcount.indexOf(key)],
      title: ChartTitle(
          text: '${dataa['$Bar']['chartTitle']}',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
          minimum: 10,
          maximum: max,
          interval: max - min,
          majorGridLines: const MajorGridLines(width: 1),
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ChartSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: PositionsCountbyLocation,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y!,
        )
      ],
    ),
  );
}

//Funnel
Funnelchartconvert(String Funneldata) {
  List<ChartSampleData> Funnelchart = [];
  for (int i = 0;
      i < dataa['$Funneldata']['chartLevelsAndValueObj'].length;
      i++) {
    Funnelchart.add(
      ChartSampleData(
        x: dataa['$Funneldata']['chartLevelsAndValueObj'][i]['X'].toString(),
        y: dataa['$Funneldata']['chartLevelsAndValueObj'][i]['Y'],
        text:
            '${dataa['$Funneldata']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['$Funneldata']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
      ),
    );
  }
  return Card(
    child: SfFunnelChart(
      //   smartLabelMode: SmartLabelMode.none,
      title: ChartTitle(text: '${dataa['$Funneldata']['chartTitle']}'),
      // tooltipBehavior: Funneltooltip,

      /// To enable the legend for funnel chart.
      // legend: Legend(
      //     isVisible: true,
      //     overflowMode: LegendItemOverflowMode.wrap),

      series: FunnelSeries<ChartSampleData, String>(
          dataSource: Funnelchart,
          textFieldMapper: (ChartSampleData dataa, _) => dataa.text,
          xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
          yValueMapper: (ChartSampleData dataa, _) => dataa.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.inside)),
    ),
  );
}

// radar

RadarCharttconvert(String Radachartdata, BuildContext context) {
  List<int> tickss = [];
  List<int> initial = [];
  tickss.clear();
  initial.clear();
  List<String> features = [];
  List<int> data = [];
  List<List<int>> finaldata = [data];
  List length = [];
  for (int i = 0;
      i < dataa['$Radachartdata']['chartLevelsAndValueObj'].length;
      i++) {
    features.add(
        dataa['$Radachartdata']['chartLevelsAndValueObj'][i]['X'].toString());

    data.add(dataa['$Radachartdata']['chartLevelsAndValueObj'][i]['Y'].toInt());
    length
        .add(dataa['$Radachartdata']['chartLevelsAndValueObj'][i]['Y'].toInt());
  }
  // print(features.toList());
  // print(data.toList());
  int max = length.reduce((curr, next) => curr > next ? curr : next);
  int min = length.reduce((curr, next) => curr < next ? curr : next);

  tickss.add(min);
  tickss.add((max / 5).toInt());
  tickss.add((max / 4).toInt());
  tickss.add((max / 3).toInt());
  tickss.add(max);
  print('new data');
  print(tickss.toList());
  return Container(
    height:
        MediaQuery.of(context).orientation == Orientation.landscape ? 335 : 300,
    width: MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width * 0.4
        : MediaQuery.of(context).size.width * 0.76,
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Radar.light(
          ticks: tickss,
          features: features,
          data: finaldata,
          reverseAxis: false,
          // useSides: useSides,
        ),
      ),
    ),
  );
}
