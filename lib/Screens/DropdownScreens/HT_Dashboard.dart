// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:integraphics/Services/DropdownAPIService.dart';
// import 'package:integraphics/main.dart';
// import 'package:integraphics/widgets/ChartSampledata.dart';
// import 'package:integraphics/widgets/Tooltips.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_treemap/treemap.dart';

// class HT_Dashboard extends StatefulWidget {
//   const HT_Dashboard({super.key});

//   @override
//   State<HT_Dashboard> createState() => _HT_DashboardState();
// }

// class _HT_DashboardState extends State<HT_Dashboard> {
//   @override
//   void initState() {
//     // _source = <SocialMediaUsers>[
//     //   SocialMediaUsers('India', 'Facebook', 25.4),
//     //   SocialMediaUsers('USA', 'Instagram', 19.11),
//     //   SocialMediaUsers('Japan', 'Facebook', 13.3),
//     //   SocialMediaUsers('Germany', 'Instagram', 10.65),
//     //   SocialMediaUsers('France', 'Twitter', 7.54),
//     //   SocialMediaUsers('UK', 'Instagram', 4.93),
//     // ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     late Future<dynamic> _value = AllChartdataAPi(context, Selectedinput);
//     return Scaffold(
//       body: FutureBuilder<dynamic>(
//         future: _value,
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<dynamic> snapshot,
//         ) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: SpinKitSpinningLines(
//                 lineWidth: 5,
//                 size: 100,
//                 color: Color(0xff6d96fa),
//               ),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasError) {
//               return const Text('Error');
//             } else if (snapshot.hasData) {
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Column(
//                     children: [
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         elevation: 10,
//                         color: Colors.grey[200],
//                         child: Padding(
//                             padding: EdgeInsets.all(12),
//                             child: Row(
//                               children: [
//                                 HT1(),
//                                 Tooltips(),
//                               ],
//                             )),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         elevation: 10,
//                         color: Colors.grey[200],
//                         child: Padding(
//                             padding: EdgeInsets.all(12),
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: [
//                                   Treemap(),
//                                   Tooltips(),
//                                 ],
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return const Text('Empty data');
//             }
//           } else {
//             return Text('State: ${snapshot.connectionState}');
//           }
//         },
//       ),
//     );
//   }

//   //HT
//   HT1() {
//     List<ChartSampleData> NoOfL1InterviewsTakenByStatus = [];
//     for (int i = 0;
//         i < dataa['chartData0']['chartLevelsAndValueObj'].length;
//         i++) {
//       NoOfL1InterviewsTakenByStatus.add(
//         ChartSampleData(
//             x: dataa['chartData0']['chartLevelsAndValueObj'][i]['X'].toString(),
//             y: dataa['chartData0']['chartLevelsAndValueObj'][i]['Y'],
//             text:
//                 ' ${(dataa['chartData0']['chartLevelsAndValueObj'][i]['X']).toString()}\n${(dataa['chartData0']['chartLevelsAndValueObj'][i]['Y']).toString()}'),
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
//       title: ChartTitle(text: ''),
//       legend: Legend(
//         isVisible: true,
//         overflowMode: LegendItemOverflowMode.wrap,
//         position: LegendPosition.bottom,
//       ),
//       series: <PieSeries<ChartSampleData, String>>[
//         PieSeries<ChartSampleData, String>(
//             enableTooltip: true,
//             explode: true,
//             explodeIndex: 0,
//             explodeOffset: '0%',
//             dataSource: NoOfL1InterviewsTakenByStatus,
//             xValueMapper: (ChartSampleData dataa, _) => dataa.x as String,
//             yValueMapper: (ChartSampleData dataa, _) => dataa.y,
//             dataLabelMapper: (ChartSampleData dataa, _) => dataa.text,
//             startAngle: 0,
//             endAngle: 0,
//             dataLabelSettings: const DataLabelSettings(isVisible: true)),
//       ],
//     );
//   }

//   late List<TreemapColorMapper> _colorMappers;

//   //Tree Map
//   Treemap() {
//     _colorMappers = <TreemapColorMapper>[
//       TreemapColorMapper.value(value: 'India', color: Colors.green),
//       TreemapColorMapper.value(value: 'USA', color: Colors.blue),
//       TreemapColorMapper.value(value: 'Japan', color: Colors.red),
//     ];
//     List _source = [];
//     for (int i = 0;
//         i < dataa['chartData3']['chartLevelsAndValueObj'].length;
//         i++) {
//       _source.add(TestData(
//         dataa['chartData3']['chartLevelsAndValueObj'][i]['X'].toString(),
//         dataa['chartData3']['chartLevelsAndValueObj'][i]['Y'] + .0,
//       ));
//     }
//     return SfTreemap(
//       breadcrumbs: TreemapBreadcrumbs(
//         builder: (BuildContext context, TreemapTile tile, bool isCurrent) {
//           return Text(tile.group);
//         },
//       ),
//       selectionSettings: TreemapSelectionSettings(color: Colors.greenAccent),
//       // colorMappers: _colorMappers,
//       dataCount: _source.length,
//       weightValueMapper: (int index) {
//         return _source[index].Y;
//       },
//       levels: [
//         TreemapLevel(
//           groupMapper: (int index) {
//             return _source[index].X.toString();
//           },
//           labelBuilder: (BuildContext context, TreemapTile tile) {
//             return Padding(
//               padding: const EdgeInsets.all(2.5),
//               child: Text(
//                 '${tile.group}',
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           },
//           tooltipBuilder: (BuildContext context, TreemapTile tile) {
//             return Padding(
//               padding: const EdgeInsets.all(10),
//               child: Text('X          : ${tile.group}\nY : ${tile.weight}',
//                   style: TextStyle(color: Colors.black)),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class TestData {
//   const TestData(
//     this.X,
//     this.Y,
//   );

//   final String X;
//   final double Y;
// }
