import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Infographics.dart';
import 'Services/themesetup/DarkThemeProvider.dart';
import 'Services/themesetup/styles.dart';
import 'login/loginPage.dart';

void main() {
  runApp(MyApp());
}

Color currentColor = Color(0xff443a49);

var Selectedinput;
var dataa;
List<Widget> allgraph = [];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
