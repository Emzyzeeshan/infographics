import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/radarchart.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import 'ChartSampleData.dart';

//1

PiechartConvert(String chartname, BuildContext context) {
  FlipCardController flipCardController1 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return Container(
    height: MediaQuery.of(context).size.height * 0.47,
    width: MediaQuery.of(context).size.width,
    child: FlipCard(
        controller: flipCardController1,
        front: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
        ),
        back: Container(
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount: dataa['$chartname']['chartLevelsAndValueObj'].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffAED6F1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${dataa['$chartname']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                          Text(
                              '${dataa['$chartname']['chartLevelsAndValueObj'][index]['Y']}'),
                        ]),
                  );
                }),
              )),
        )),
  );
}

//2
DoughnutConvert(String donutchart, BuildContext context) {
  FlipCardController flipCardController2 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return Container(
    height: MediaQuery.of(context).size.height * 0.47,
    width: MediaQuery.of(context).size.width,
    child: FlipCard(
        controller: flipCardController2,
        front: Card(
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
        ),
        back: Container(
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount:
                    dataa['$donutchart']['chartLevelsAndValueObj'].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffAED6F1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${dataa['$donutchart']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                          Text(
                              '${dataa['$donutchart']['chartLevelsAndValueObj'][index]['Y']}'),
                        ]),
                  );
                }),
              )),
        )),
  );
}

//3 column
TooltipBehavior ColumnConvert_tooltipBehavior = TooltipBehavior();
ColumnConvert(String Coloumnchart, BuildContext context) {
  FlipCardController flipCardController3 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return Container(
    height: MediaQuery.of(context).size.height * 0.47,
    width: MediaQuery.of(context).size.width,
    child: FlipCard(
        controller: flipCardController3,
        front: Card(
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
        ),
        back: Container(
            height: MediaQuery.of(context).size.height * 0.47,
            width: MediaQuery.of(context).size.width,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 70,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 3),
                    itemCount:
                        dataa['$Coloumnchart']['chartLevelsAndValueObj'].length,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color(0xffAED6F1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${dataa['$Coloumnchart']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                              Text(
                                  '${dataa['$Coloumnchart']['chartLevelsAndValueObj'][index]['Y']}'),
                            ]),
                      );
                    }))))),
  );
}

//bar 4
TooltipBehavior BarSeiesConvert_tooltipBehavior = TooltipBehavior();
BarSeiesConvert(String Bar, BuildContext context) {
  FlipCardController flipCardController4 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return Container(
    height: MediaQuery.of(context).size.height * 0.47,
    width: MediaQuery.of(context).size.width,
    child: FlipCard(
      controller: flipCardController4,
      front: Card(
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
      ),
      back: Container(
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 70,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemCount: dataa['$Bar']['chartLevelsAndValueObj'].length,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color(0xffAED6F1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${dataa['$Bar']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                            Text(
                                '${dataa['$Bar']['chartLevelsAndValueObj'][index]['Y']}'),
                          ]),
                    );
                  })))),
    ),
  );
}

//Funnel 5
Funnelchartconvert(String Funneldata, BuildContext context) {
  FlipCardController flipCardController5 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return FlipCard(
    controller: flipCardController5,
    front: Card(
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
    ),
    back: Container(
        height: MediaQuery.of(context).size.height * 0.47,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount:
                    dataa['$Funneldata']['chartLevelsAndValueObj'].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffAED6F1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${dataa['$Funneldata']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                          Text(
                              '${dataa['$Funneldata']['chartLevelsAndValueObj'][index]['Y']}'),
                        ]),
                  );
                })))),
  );
}

// radar 6

RadarCharttconvert(String Radachartdata, BuildContext context) {
  FlipCardController flipCardController6 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
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
  return FlipCard(
    controller: flipCardController6,
    front: Container(
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? 335
          : 300,
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
    ),
    back: Container(
        height: MediaQuery.of(context).size.height * 0.47,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount:
                    dataa['$Radachartdata']['chartLevelsAndValueObj'].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffAED6F1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${dataa['$Radachartdata']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                          Text(
                              '${dataa['$Radachartdata']['chartLevelsAndValueObj'][index]['Y']}'),
                        ]),
                  );
                })))),
  );
}

// 7 Spline

Lineschartconvert(String Lineschart, BuildContext context) {
  FlipCardController flipCardController7 = FlipCardController();
  final orientation = MediaQuery.of(context).orientation;
  List<ChartSampleData> Linescharts = [];
  List sortlist = [];
  for (int i = 0;
      i < dataa['$Lineschart']['chartLevelsAndValueObj'].length;
      i++) {
    Linescharts.add(
      ChartSampleData(
          x: dataa['$Lineschart']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['$Lineschart']['chartLevelsAndValueObj'][i]['Y'],
          size: 0.37,
          pointColor: Colors.purple),
    );
    sortlist.add(dataa['$Lineschart']['chartLevelsAndValueObj'][i]['Y']);

    // sortlist
    //     .add();

  }

  // print(sortlist.toList());
  // print(sortlist.reduce((curr, next) => curr > next ? curr : next));
  // print(sortlist.reduce((curr, next) => curr < next ? curr : next));
  return FlipCard(
    controller: flipCardController7,
    front: Card(
      child: SfCartesianChart(
        // palette: <Color>[Linescolor[Linescount.indexOf(key)]],
        zoomPanBehavior: ZoomPanBehavior(
            enableDoubleTapZooming: true,
            enableSelectionZooming: true,
            enablePanning: true,
            enablePinching: true),
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: '${dataa['$Lineschart']['chartTitle']}'),
        primaryXAxis: CategoryAxis(
            labelRotation: 20,
            labelsExtent: 50,
            majorGridLines: const MajorGridLines(width: 0),
            labelPlacement: LabelPlacement.onTicks),
        primaryYAxis: NumericAxis(
            minimum:
                sortlist.reduce((curr, next) => curr < next ? curr : next) + .0,
            maximum:
                sortlist.reduce((curr, next) => curr > next ? curr : next) + .0,
            axisLine: const AxisLine(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            labelFormat: '{value}',
            majorTickLines: const MajorTickLines(size: 0)),
        series: <SplineSeries<ChartSampleData, String>>[
          SplineSeries<ChartSampleData, String>(
            dataSource: Linescharts,
            xValueMapper: (ChartSampleData sales, _) => sales.x as String,
            yValueMapper: (ChartSampleData sales, _) => sales.y,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    ),
    back: Container(
        height: MediaQuery.of(context).size.height * 0.47,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount:
                    dataa['$Lineschart']['chartLevelsAndValueObj'].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffAED6F1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${dataa['$Lineschart']['chartLevelsAndValueObj'][index]['X'].toString()}'),
                          Text(
                              '${dataa['$Lineschart']['chartLevelsAndValueObj'][index]['Y']}'),
                        ]),
                  );
                })))),
  );
}

//Tree Map
Treemap() {
  // late List<TreemapColorMapper> _colorMappers;
  // _colorMappers = <TreemapColorMapper>[
  //   TreemapColorMapper.value(value: 'India', color: Colors.green),
  //   TreemapColorMapper.value(value: 'USA', color: Colors.blue),
  //   TreemapColorMapper.value(value: 'Japan', color: Colors.red),
  // ];
  List _source = [];
  for (int i = 0;
      i < dataa['chartData3']['chartLevelsAndValueObj'].length;
      i++) {
    _source.add(TestData(
      dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
      dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'] + .0,
    ));
  }
  return SfTreemap(
    breadcrumbs: TreemapBreadcrumbs(
      builder: (BuildContext context, TreemapTile tile, bool isCurrent) {
        return Text(tile.group);
      },
    ),
    selectionSettings: TreemapSelectionSettings(color: Colors.greenAccent),
    // colorMappers: _colorMappers,
    dataCount: _source.length,
    weightValueMapper: (int index) {
      return _source[index].Y;
    },
    levels: [
      TreemapLevel(
        groupMapper: (int index) {
          return _source[index].X.toString();
        },
        labelBuilder: (BuildContext context, TreemapTile tile) {
          return Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text(
              '${tile.group}',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
        tooltipBuilder: (BuildContext context, TreemapTile tile) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text('X          : ${tile.group}\nY : ${tile.weight}',
                style: TextStyle(color: Colors.black)),
          );
        },
      ),
    ],
  );
}

class TestData {
  const TestData(
    this.X,
    this.Y,
  );

  final String X;
  final double Y;
}
