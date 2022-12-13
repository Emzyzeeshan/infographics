import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:http/http.dart';
import 'package:integraphics/Screens/DropdownScreens/HR_Dashboard.dart';
import 'package:integraphics/Services/DropdownAPIService.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/ChartSampleData.dart';
import 'package:integraphics/widgets/Tooltips.dart';
import 'package:spider_chart/spider_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemandSupply extends StatefulWidget {
  const DemandSupply({super.key});

  @override
  State<DemandSupply> createState() => _DemandSupplyState();
}

class _DemandSupplyState extends State<DemandSupply> {
  @override
  void initState() {
    DemandBySubCategory_tooltipBehavior = TooltipBehavior(
        textAlignment: ChartAlignment.center,
        enable: true,
        canShowMarker: false,
        header: '',
        format: ' point.x\n  point.y ');
    DemandByCategory_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    DemandByCommodity_tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    // TODO: implement initState
    super.initState();
  }

  TooltipBehavior? DemandByCategory_tooltipBehavior;
  TooltipBehavior? DemandByCommodity_tooltipBehavior;
  TooltipBehavior? DemandBySubCategory_tooltipBehavior;

  late Future<dynamic> _value = AllChartdataAPi(context, Selectedinput);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                DemandByCategory(),
                                Tooltips(),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [SupplybyVendor(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [ProductByUoM(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [DemandBySubCategory(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [ProductsByCategory(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [DemandByMaterialType(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                SupplyByDomesticNonDomestic(),
                                Tooltips()
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [ProductsBySubCategory(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [DemandByCommodity(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [DemandByCommodity(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [ProductsByCommodity(), Tooltips()],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.blueAccent),
                      //       borderRadius: BorderRadius.circular(15)),
                      //   elevation: 10,
                      //   color: Colors.grey[200],
                      //   child: Padding(
                      //       padding: EdgeInsets.all(12),
                      //       child: Row(
                      //         children: [ProducByOrganisation(), Tooltips()],
                      //       )),
                      // ),
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

  // Future<dynamic> chartDataAPiDemandAndSupply() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = json.encode({"dashbordname": "Demand & Supply"});
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
  //     print(dataa['chartData2']['chartLevelsAndValueObj'][0]['X'].toString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   return dataa;
  // }

  //Demand By Category
  DemandByCategory() {
    List<ChartSampleData> PipelineByProductandservice = [];
    for (int i = 0;
        i < dataa['chartData0']['chartLevelsAndValueObj'].length;
        i++) {
      PipelineByProductandservice.add(
        ChartSampleData(
          x: dataa['chartData0']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData0']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'].toString()}%',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: DemandByCategory_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(0, 168, 181, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Demand By Category',
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

  //Supply by Vendor
  SupplybyVendor() {
    List<ChartSampleData> SupplybyVendor = [];

    for (int i = 0;
        i < dataa['chartData1']['chartLevelsAndValueObj'].length;
        i++) {
      SupplybyVendor.add(
        ChartSampleData(
          x: dataa['chartData1']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData1']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData1']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData1']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: DemandByCategory_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1),
        Color.fromRGBO(238, 238, 238, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Supply by Vendor',
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
          dataSource: SupplybyVendor,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Products By UOM
  ProductByUoM() {
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
    List<ChartSampleData> ProductByUoM = [];
    for (int i = 0;
        i < dataa['chartData2']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByUoM.add(
        ChartSampleData(
            x: dataa['chartData2']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData2']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
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
          text: 'Products By UOM',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            enableTooltip: true,
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: ProductByUoM,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Demand By Sub Category
  DemandBySubCategory() {
    List<ChartSampleData> DemandBySubCategory = [];
    for (int i = 0;
        i < dataa['chartData4']['chartLevelsAndValueObj'].length;
        i++) {
      DemandBySubCategory.add(
        ChartSampleData(
            x: dataa['chartData4']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData4']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.purple),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: DemandBySubCategory_tooltipBehavior,
      title: ChartTitle(text: 'Demand By Sub Category'),
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
          dataSource: DemandBySubCategory,
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

  //Products By Category
  ProductsByCategory() {
    List<ChartSampleData> ProductsByCategory = [];

    for (int i = 0;
        i < dataa['chartData9']['chartLevelsAndValueObj'].length;
        i++) {
      ProductsByCategory.add(
        ChartSampleData(
          x: dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData9']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData9']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: DemandByCategory_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1),
        Color.fromRGBO(238, 238, 238, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Products By Category',
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
          dataSource: ProductsByCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Demand By Material Type
  DemandByMaterialType() {
    num total = 0;
    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      if (dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'] == null) {
        i++;
      } else
        total = total + dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'];
    }
    print(total);
    List<ChartSampleData> DemandByMaterialType = [];
    for (int i = 0;
        i < dataa['chartData8']['chartLevelsAndValueObj'].length;
        i++) {
      DemandByMaterialType.add(
        ChartSampleData(
            x: dataa['chartData8']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData8']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      title: ChartTitle(text: 'Demand By Material Type'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: DemandByMaterialType,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Supply By Domestic/Non-Domestic
  SupplyByDomesticNonDomestic() {
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
    List<ChartSampleData> ProductByUoM = [];
    for (int i = 0;
        i < dataa['chartData6']['chartLevelsAndValueObj'].length;
        i++) {
      ProductByUoM.add(
        ChartSampleData(
            x: dataa['chartData6']['chartLevelsAndValueObj'][i]['X'].toString(),
            y: dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'],
            text:
                ' ${((dataa['chartData6']['chartLevelsAndValueObj'][i]['Y'] / total) * 100).toString().characters.take(5)}%'),
      );
    }
    return SfCircularChart(
      palette: [
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
      ],
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
      ),
      title: ChartTitle(
          text: 'Supply By Domestic/Non-Domestic',
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            enableTooltip: true,
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: ProductByUoM,
            xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
            yValueMapper: (ChartSampleData dataa, _) => dataa.y,
            dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ],
    );
  }

  //Products By Sub-Category
  ProductsBySubCategory() {
    List<ChartSampleData> ProductsBySubCategory = [];

    for (int i = 0;
        i < dataa['chartData10']['chartLevelsAndValueObj'].length;
        i++) {
      ProductsBySubCategory.add(
        ChartSampleData(
            x: dataa['chartData10']['chartLevelsAndValueObj'][i]['X']
                .toString(),
            y: dataa['chartData10']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.purple),
      );
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Products By Sub-Category'),
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
          dataSource: ProductsBySubCategory,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  //Demand By Commodity
  DemandByCommodity() {
    List<ChartSampleData> DemandByCommodity = [];

    for (int i = 0;
        i < dataa['chartData13']['chartLevelsAndValueObj'].length;
        i++) {
      DemandByCommodity.add(
        ChartSampleData(
          x: dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString(),
          y: dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'],
          text:
              '${dataa['chartData13']['chartLevelsAndValueObj'][i]['X'].toString()} \n ${dataa['chartData13']['chartLevelsAndValueObj'][i]['Y'].toString()}',
        ),
      );
    }
    return SfCartesianChart(
      tooltipBehavior: DemandByCommodity_tooltipBehavior,
      palette: <Color>[
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1),
        Color.fromRGBO(238, 238, 238, 1),
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Demand By Commodity',
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
          dataSource: DemandByCommodity,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  //Products By Commodity
  ProductsByCommodity() {
    List<ChartSampleData> ProductsByCommodity = [];

    for (int i = 0;
        i < dataa['chartData14']['chartLevelsAndValueObj'].length;
        i++) {
      ProductsByCommodity.add(
        ChartSampleData(
            x: dataa['chartData14']['chartLevelsAndValueObj'][i]['X']
                .toString(),
            y: dataa['chartData14']['chartLevelsAndValueObj'][i]['Y'],
            size: 0.37,
            pointColor: Colors.purple),
      );
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Products By Commodity'),
      primaryXAxis: CategoryAxis(
          labelRotation: 20,
          labelsExtent: 50,
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 90,
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <SplineSeries<ChartSampleData, String>>[
        SplineSeries<ChartSampleData, String>(
          dataSource: ProductsByCommodity,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  //Product By Organisation
  ProducByOrganisation() {
    List<double> ProducByOrganisation = [];
    for (int i = 0;
        i < dataa['chartData3']['chartLevelsAndValueObj'].length;
        i++) {
      ProducByOrganisation.add(
        dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'],
      );
      return SpiderChart(
        data: ProducByOrganisation,
        maxValue:
            10, // the maximum value that you want to represent (essentially sets the dataa scale of the chart)
        colors: <Color>[
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
          Colors.indigo,
        ],
      );
    }
  }
}
