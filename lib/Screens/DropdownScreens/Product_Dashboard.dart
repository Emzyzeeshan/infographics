import 'package:flutter/material.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/ChartSampledata.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Product_Dashboard extends StatefulWidget {
  const Product_Dashboard({super.key});

  @override
  State<Product_Dashboard> createState() => _Product_DashboardState();
}

class _Product_DashboardState extends State<Product_Dashboard> {
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
                              children: [
                                PotentialDuplicatesByClass(),
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
                              children: [ProductByHSN(), Tooltips()],
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
                              children: [ProductByClass(), Tooltips()],
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductByDiscipline(),
                                  Tooltips(),
                                ],
                              ),
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductByUNSPSC(),
                                  Tooltips(),
                                ],
                              ),
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductByNATOCode(),
                                  Tooltips(),
                                ],
                              ),
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductsByCategory(),
                                  Tooltips(),
                                ],
                              ),
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductsBySubCategory(),
                                  Tooltips(),
                                ],
                              ),
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

  //Potential Duplicates By Class
  PotentialDuplicatesByClass() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData0']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> PotentialDuplicatesByClass = [];
    for (int i = 0;
        i < dataa['chartData0']['chartLevelsAndValueObj'].length - 1;
        i++) {
      PotentialDuplicatesByClass.add(
        ChartSampleData(
            x: dataa['chartData0']['chartLevelsAndValueObj'][i]['X']
                .toString()
                .replaceRange(0, 13, ''),
            y: dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
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
      title: ChartTitle(text: 'Potential Duplicates By Class'),
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
            dataSource: PotentialDuplicatesByClass,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Product By HSN
  ProductByHSN() {
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
    List<ChartSampleData> ProductByHSN = [];
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length - 1;
        i++) {
      ProductByHSN.add(
        ChartSampleData(
            x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X']
                .toString()
                .replaceRange(0, 13, ''),
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
      title: ChartTitle(text: ''),
      legend: Legend(
        isResponsive: true,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: ProductByHSN,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Product By Class
  ProductByClass() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> ProductByClass = [];
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByClass.add(
        ChartSampleData(
            x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xfffce5cd),
        Color(0xffd9d2e9),
        Color(0xffd0e0e3),
        Color(0xffffd966),
        Color(0xffe06666),
        Color(0xffd0e0e3),
        Color(0xffce7e00),
        Color(0xffc27ba0),
        Color(0xffffe599),
        Color(0xffd9d2e9),
        Color(0xffc5c169)
      ],
      title: ChartTitle(text: 'Product By Class'),
      legend: Legend(
        isResponsive: true,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: ProductByClass,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Product By Discipline
  ProductByDiscipline() {
    List<ChartSampleData> ProductByDiscipline = [];
    for (int i = 0;
        i < dataa['chartData5']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByDiscipline.add(
        ChartSampleData(
          x: dataa['chartData5']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData5']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData5']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData5']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
        Color(0xff1864b1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Product By Discipline',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelRotation: 35,
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
          dataSource: ProductByDiscipline,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Product By UNSPSC
  ProductByUNSPSC() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData6']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> ProductByUNSPSC = [];
    for (int i = 0;
        i < dataa['chartData6']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByUNSPSC.add(
        ChartSampleData(
            x: dataa['chartData6']['chartLevelsAndValueObj'][i]['X']
                .toString()
                .replaceRange(0, 9, ''),
            y: dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      palette: [
        Color(0xfffce5cd),
        Color(0xffd9d2e9),
        Color(0xffd0e0e3),
        Color(0xffffd966),
        Color(0xffe06666),
        Color(0xffd0e0e3),
        Color(0xffce7e00),
        Color(0xffc27ba0),
        Color(0xffffe599),
        Color(0xffd9d2e9),
        Color(0xffc5c169)
      ],
      title: ChartTitle(text: 'Product By UNSPSC'),
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
            explodeOffset: '10%',
            dataSource: ProductByUNSPSC,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 0,
            endAngle: 0,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Product By NATO Code
  ProductByNATOCode() {
    List<ChartSampleData> ProductByNATOCode = [];
    for (int i = 0;
        i < dataa['chartData7']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByNATOCode.add(
        ChartSampleData(
          x: dataa['chartData7']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData7']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData7']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData7']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1),
        Color(0xff1864b1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Product By NATO Code',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelRotation: 0,
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
          dataSource: ProductByNATOCode,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Products By Category
  ProductsByCategory() {
    List<ChartSampleData> ProductsByCategory = [];
    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      ProductsByCategory.add(
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
      tooltipBehavior: ProductByDiscipline_tooltipBehavior,
      palette: <Color>[
        Color(0xffe06666),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Products By Category',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelRotation: 0,
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
          dataSource: ProductsByCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Products By Sub-Category
  ProductsBySubCategory() {
    List<ChartSampleData> ProductsBySubCategory = [];
    for (int i = 0;
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      ProductsBySubCategory.add(
        ChartSampleData(
          x: dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'].toString()}',
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
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1),
        Color(0xff1864b1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Products By Sub-Category',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      primaryXAxis: CategoryAxis(
        labelRotation: 0,
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
          dataSource: ProductsBySubCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }
}
