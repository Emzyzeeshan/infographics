import 'package:flutter/material.dart';
import 'package:integraphics/Screens/Infographics.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Widget buildBody() {
  return SleekCircularSlider(
      appearance: CircularSliderAppearance(
    size: 50,
    customColors: CustomSliderColors(
        trackColor: Color(0xff6d96fa), progressBarColor: Colors.white),
    spinnerMode: true,
  ));
}
