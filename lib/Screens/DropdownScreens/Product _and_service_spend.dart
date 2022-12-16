import 'package:flutter/material.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/ChartSampledata.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Product_And_Service_Spend_Dashboard extends StatefulWidget {
  const Product_And_Service_Spend_Dashboard({super.key});

  @override
  State<Product_And_Service_Spend_Dashboard> createState() =>
      _Product_And_Service_Spend_DashboardState();
}

class _Product_And_Service_Spend_DashboardState
    extends State<Product_And_Service_Spend_Dashboard> {
  @override
  void initState() {
    ProductByDiscipline_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    // TODO: implement initState
    super.initState();
  }

  TooltipBehavior ProductByDiscipline_tooltipBehavior = TooltipBehavior();
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
                              children: [SpendByProductCategory(), Tooltips()],
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
                              children: [SpendByProductClass(), Tooltips()],
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
                                SpendByProductSubCategory(),
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
                                SpendByServiceSubCategory(),
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
                              children: [SpendByISIC(), Tooltips()],
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
                              children: [SpendByMaterialGroup(), Tooltips()],
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

  //Spend By Product Category
  SpendByProductCategory() {
    List<ChartSampleData> SpendByProductCategory = [];
    for (int i = 0;
        i < dataa['chartData1']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByProductCategory.add(
        ChartSampleData(
          x: dataa['chartData1']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData1']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData1']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData1']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: ProductByDiscipline_tooltipBehavior,
      palette: <Color>[
        Color.fromARGB(255, 116, 15, 130),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Spend By Product Category',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelsExtent: 3,
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
          dataSource: SpendByProductCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Spend By Product Class
  SpendByProductClass() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> SpendByProductClass = [];
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByProductClass.add(
        ChartSampleData(
            x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color(0xff40875e),
        Color(0xff58b07e),
        Color(0xffc48c00),
        Color(0xfff0ab00),
        Color(0xffc6910f),
        Color(0xffdeb449),
        Color(0xffffcc4b),
        Color(0xff827e32),
        Color(0xffa8a240),
        Color(0xffc5c169)
      ],
      title: ChartTitle(text: 'Spend By Product Class'),
      legend: Legend(
        shouldAlwaysShowScrollbar: true,
        isResponsive: true,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '0%',
            dataSource: SpendByProductClass,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Spend By Product Sub-Category
  SpendByProductSubCategory() {
    List<ChartSampleData> SpendByProductSubCategory = [];

    for (int i = 0;
        i < dataa['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByProductSubCategory.add(
        ChartSampleData(
            x: dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.purple),
      );
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Spend Product By Sub-Category'),
      primaryXAxis: CategoryAxis(
          labelRotation: 20,
          labelsExtent: 50,
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 40000000,
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <SplineSeries<ChartSampleData, String>>[
        SplineSeries<ChartSampleData, String>(
          dataSource: SpendByProductSubCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  // //Spend By Service Category
  // SpendByServiceCategory() {
  //   num total = 0;
  //   for (int i = 0;
  //       i < dataa['chartData2']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     if (dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'] == null) {
  //       i++;
  //     } else
  //       total = total + dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'];
  //   }
  //   print(total);
  //   List<ChartSampleData> SpendByServiceCategory = [];
  //   for (int i = 0;
  //       i < dataa['chartData2']['chartLevelsAndValueObj'].length;
  //       i++) {
  //     SpendByServiceCategory.add(
  //       ChartSampleData(
  //           x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
  //           y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
  //           text:
  //               ' ${((dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
  //     );
  //   }
  //   return SfCircularChart(
  //     palette: [
  //       Color(0xff2f6345),
  //       Color(0xff40875e),
  //       Color(0xff58b07e),
  //       Color(0xffc48c00),
  //       Color(0xfff0ab00),
  //       Color(0xffc6910f),
  //       Color(0xffdeb449),
  //       Color(0xffffcc4b),
  //       Color(0xff827e32),
  //       Color(0xffa8a240),
  //       Color(0xffc5c169)
  //     ],
  //     title: ChartTitle(text: 'Spend By Product Class'),
  //     legend: Legend(
  //       shouldAlwaysShowScrollbar: true,
  //       isResponsive: true,
  //       isVisible: true,
  //       overflowMode: LegendItemOverflowMode.wrap,
  //       position: LegendPosition.bottom,
  //     ),
  //     series: <PieSeries<ChartSampleData, String>>[
  //       PieSeries<ChartSampleData, String>(
  //           explode: true,
  //           explodeIndex: 0,
  //           explodeOffset: '0%',
  //           dataSource: SpendByServiceCategory,
  //           xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
  //           yValueMapper: (ChartSampleData dataa, _) => dataa.y,
  //           dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
  //           startAngle: 0,
  //           endAngle: 0,
  //           dataLabelSettings: const DataLabelSettings(isVisible: true)),
  //     ],
  //   );
  // }

  //Spend By Service Sub-Category
  SpendByServiceSubCategory() {
    List<ChartSampleData> SpendByServiceSubCategory = [];
    for (int i = 0;
        i < dataa['chartData6']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByServiceSubCategory.add(
        ChartSampleData(
          x: dataa['chartData6']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData6']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
          enablePinching: true),
      tooltipBehavior: ProductByDiscipline_tooltipBehavior,
      palette: <Color>[
        Color.fromARGB(255, 116, 15, 130),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Spend By Service Sub-Category',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelsExtent: 3,
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
          dataSource: SpendByServiceSubCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Spend By ISIC
  SpendByISIC() {
    List<ChartSampleData> SpendByProductSubCategory = [];

    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByProductSubCategory.add(
        ChartSampleData(
            x: dataa['chartData8']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.purple),
      );
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Spend By ISIC'),
      primaryXAxis: CategoryAxis(
          labelRotation: 20,
          labelsExtent: 50,
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 600000000,
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <SplineSeries<ChartSampleData, String>>[
        SplineSeries<ChartSampleData, String>(
          dataSource: SpendByProductSubCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  //Spend By Material Group
  SpendByMaterialGroup() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> SpendByMaterialGroup = [];
    for (int i = 0;
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      SpendByMaterialGroup.add(
        ChartSampleData(
            x: dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xff2f6345),
        Color(0xff40875e),
        Color(0xff58b07e),
        Color(0xffc48c00),
        Color(0xfff0ab00),
        Color(0xffc6910f),
        Color(0xffdeb449),
        Color(0xffffcc4b),
        Color(0xff827e32),
        Color(0xffa8a240),
        Color(0xffc5c169)
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'Spend By Material Group',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: SpendByMaterialGroup,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }
}
