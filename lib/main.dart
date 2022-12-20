import 'package:flutter/material.dart';

import 'login/loginPage.dart';

void main() {
  runApp(MyApp());
}

Color currentColor = Color(0xff443a49);
Color pickerColor = Color(0xff443a49);
var Selectedinput;
var dataa;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
