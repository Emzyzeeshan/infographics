import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

//piecontrollers
var pieScreeshotcontroller1 = ScreenshotController();
var pieScreeshotcontroller2 = ScreenshotController();
var pieScreeshotcontroller3 = ScreenshotController();
var pieScreeshotcontroller4 = ScreenshotController();
var pieScreeshotcontroller5 = ScreenshotController();
var pieScreeshotcontroller6 = ScreenshotController();
var pieScreeshotcontroller7 = ScreenshotController();
var pieScreeshotcontroller8 = ScreenshotController();
var pieScreeshotcontroller9 = ScreenshotController();
var pieScreeshotcontroller10 = ScreenshotController();
List PieScreeshotcontrollerlist = [
  pieScreeshotcontroller1,
  pieScreeshotcontroller2,
  pieScreeshotcontroller3,
  pieScreeshotcontroller4,
  pieScreeshotcontroller5,
  pieScreeshotcontroller6,
  pieScreeshotcontroller7,
  pieScreeshotcontroller8,
  pieScreeshotcontroller9,
  pieScreeshotcontroller10
];

//donut controllers
var donutScreenshotcontroller1 = ScreenshotController();
var donutScreenshotcontroller2 = ScreenshotController();
var donutScreenshotcontroller3 = ScreenshotController();
var donutScreenshotcontroller4 = ScreenshotController();
var donutScreenshotcontroller5 = ScreenshotController();
var donutScreenshotcontroller6 = ScreenshotController();
var donutScreenshotcontroller7 = ScreenshotController();
var donutScreenshotcontroller8 = ScreenshotController();
var donutScreenshotcontroller9 = ScreenshotController();
var donutScreenshotcontroller10 = ScreenshotController();
List<ScreenshotController> DonutScreeshotcontrollerlist = [
  donutScreenshotcontroller1,
  donutScreenshotcontroller2,
  donutScreenshotcontroller3,
  donutScreenshotcontroller4,
  donutScreenshotcontroller5,
  donutScreenshotcontroller6,
  donutScreenshotcontroller7,
  donutScreenshotcontroller8,
  donutScreenshotcontroller9,
  donutScreenshotcontroller10
];

//Columnchart Controller
var ColumnScreenshotcontroller1 = ScreenshotController();
var ColumnScreenshotcontroller2 = ScreenshotController();
var ColumnScreenshotcontroller3 = ScreenshotController();
var ColumnScreenshotcontroller4 = ScreenshotController();
var ColumnScreenshotcontroller5 = ScreenshotController();
var ColumnScreenshotcontroller6 = ScreenshotController();
var ColumnScreenshotcontroller7 = ScreenshotController();
var ColumnScreenshotcontroller8 = ScreenshotController();
var ColumnScreenshotcontroller9 = ScreenshotController();
var ColumnScreenshotcontroller10 = ScreenshotController();
List<ScreenshotController> ColumnScreeshotcontrollerlist = [
  ColumnScreenshotcontroller1,
  ColumnScreenshotcontroller2,
  ColumnScreenshotcontroller3,
  ColumnScreenshotcontroller4,
  ColumnScreenshotcontroller5,
  ColumnScreenshotcontroller6,
  ColumnScreenshotcontroller7,
  ColumnScreenshotcontroller8,
  ColumnScreenshotcontroller9,
  ColumnScreenshotcontroller10,
];

//Barchart Controller
var BarScreenshotcontroller1 = ScreenshotController();
var BarScreenshotcontroller2 = ScreenshotController();
var BarScreenshotcontroller3 = ScreenshotController();
var BarScreenshotcontroller4 = ScreenshotController();
var BarScreenshotcontroller5 = ScreenshotController();
var BarScreenshotcontroller6 = ScreenshotController();
var BarScreenshotcontroller7 = ScreenshotController();
var BarScreenshotcontroller8 = ScreenshotController();
var BarScreenshotcontroller9 = ScreenshotController();
var BarScreenshotcontroller10 = ScreenshotController();
List<ScreenshotController> BarScreeshotcontrollerlist = [
  BarScreenshotcontroller1,
  BarScreenshotcontroller2,
  BarScreenshotcontroller3,
  BarScreenshotcontroller4,
  BarScreenshotcontroller5,
  BarScreenshotcontroller6,
  BarScreenshotcontroller7,
  BarScreenshotcontroller8,
  BarScreenshotcontroller9,
  BarScreenshotcontroller10,
];

//Funnel screenshot Controller
var FunnelScreenshotcontroller1 = ScreenshotController();
var FunnelScreenshotcontroller2 = ScreenshotController();
var FunnelScreenshotcontroller3 = ScreenshotController();
var FunnelScreenshotcontroller4 = ScreenshotController();
var FunnelScreenshotcontroller5 = ScreenshotController();
var FunnelScreenshotcontroller6 = ScreenshotController();
var FunnelScreenshotcontroller7 = ScreenshotController();
var FunnelScreenshotcontroller8 = ScreenshotController();
var FunnelScreenshotcontroller9 = ScreenshotController();
var FunnelScreenshotcontroller10 = ScreenshotController();

List<ScreenshotController> FunnelScreeshotcontrollerlist = [
  FunnelScreenshotcontroller1,
  FunnelScreenshotcontroller2,
  FunnelScreenshotcontroller3,
  FunnelScreenshotcontroller4,
  FunnelScreenshotcontroller5,
  FunnelScreenshotcontroller6,
  FunnelScreenshotcontroller7,
  FunnelScreenshotcontroller8,
  FunnelScreenshotcontroller9,
  FunnelScreenshotcontroller10,
];

//Scatter Screenshot Controller
var ScatterScreenshotcontroller1 = ScreenshotController();
var ScatterScreenshotcontroller2 = ScreenshotController();
var ScatterScreenshotcontroller3 = ScreenshotController();
var ScatterScreenshotcontroller4 = ScreenshotController();
var ScatterScreenshotcontroller5 = ScreenshotController();
var ScatterScreenshotcontroller6 = ScreenshotController();
var ScatterScreenshotcontroller7 = ScreenshotController();
var ScatterScreenshotcontroller8 = ScreenshotController();
var ScatterScreenshotcontroller9 = ScreenshotController();
var ScatterScreenshotcontroller10 = ScreenshotController();
List<ScreenshotController> ScatterScreeshotcontrollerlist = [
  ScatterScreenshotcontroller1,
  ScatterScreenshotcontroller2,
  ScatterScreenshotcontroller3,
  ScatterScreenshotcontroller4,
  ScatterScreenshotcontroller5,
  ScatterScreenshotcontroller6,
  ScatterScreenshotcontroller7,
  ScatterScreenshotcontroller8,
  ScatterScreenshotcontroller9,
  ScatterScreenshotcontroller10,
];

//Lines Screenshot Controllers

var LinesScreenshotcontroller1 = ScreenshotController();
var LinesScreenshotcontroller2 = ScreenshotController();
var LinesScreenshotcontroller3 = ScreenshotController();
var LinesScreenshotcontroller4 = ScreenshotController();
var LinesScreenshotcontroller5 = ScreenshotController();
var LinesScreenshotcontroller6 = ScreenshotController();
var LinesScreenshotcontroller7 = ScreenshotController();
var LinesScreenshotcontroller8 = ScreenshotController();
var LinesScreenshotcontroller9 = ScreenshotController();
var LinesScreenshotcontroller10 = ScreenshotController();

List<ScreenshotController> LinesScreeshotcontrollerlist = [
  LinesScreenshotcontroller1,
  LinesScreenshotcontroller2,
  LinesScreenshotcontroller3,
  LinesScreenshotcontroller4,
  LinesScreenshotcontroller5,
  LinesScreenshotcontroller6,
  LinesScreenshotcontroller7,
  LinesScreenshotcontroller8,
  LinesScreenshotcontroller9,
  LinesScreenshotcontroller10,
];

//Radar Chart Screenshot controller

var RadarScreenshotcontroller1 = ScreenshotController();
var RadarScreenshotcontroller2 = ScreenshotController();
var RadarScreenshotcontroller3 = ScreenshotController();
var RadarScreenshotcontroller4 = ScreenshotController();
var RadarScreenshotcontroller5 = ScreenshotController();
var RadarScreenshotcontroller6 = ScreenshotController();
var RadarScreenshotcontroller7 = ScreenshotController();
var RadarScreenshotcontroller8 = ScreenshotController();
var RadarScreenshotcontroller9 = ScreenshotController();
var RadarScreenshotcontroller10 = ScreenshotController();

List<ScreenshotController> RadarScreeshotcontrollerlist = [
  RadarScreenshotcontroller1,
  RadarScreenshotcontroller2,
  RadarScreenshotcontroller3,
  RadarScreenshotcontroller4,
  RadarScreenshotcontroller5,
  RadarScreenshotcontroller6,
  RadarScreenshotcontroller7,
  RadarScreenshotcontroller8,
  RadarScreenshotcontroller9,
  RadarScreenshotcontroller10,
];

List<Color> Pallete1 = [
  Colors.green.shade100,
  Colors.green.shade200,
  Colors.green.shade300,
  Colors.green.shade400,
  Colors.green.shade500
];
List<Color> Pallete2 = [
  Colors.blue.shade100,
  Colors.blue.shade200,
  Colors.blue.shade300,
  Colors.blue.shade400,
  Colors.blue.shade500,
];
List<Color> Pallete3 = [
  Colors.orange.shade100,
  Colors.orange.shade200,
  Colors.orange.shade300,
  Colors.orange.shade400,
  Colors.orange.shade500,
];
List<Color> Pallete4 = [
  Colors.red.shade100,
  Colors.red.shade200,
  Colors.red.shade300,
  Colors.red.shade400,
  Colors.red.shade500,
];
List<Color> Pallete5 = [];
List<Color> Pallete6 = [];
List<Color> Pallete7 = [];
List<Color> Pallete8 = [];
List<Color> Pallete9 = [];
List<Color> Pallete10 = [];

List<List<Color>> Grouppalette = [
  Pallete1,
  Pallete2,
  Pallete3,
  Pallete4,
  Pallete5,
  Pallete6,
  Pallete7,
  Pallete8,
  Pallete9,
  Pallete10,
];
