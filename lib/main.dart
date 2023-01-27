import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integraphics/login/lg.dart';
import 'package:integraphics/widgets/unauthaccess.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Infographics.dart';
import 'Services/themesetup/DarkThemeProvider.dart';
import 'Services/themesetup/styles.dart';
import 'login/loginPage.dart';
import 'login/newphonescreen.dart';

void main() async {
  runApp(MyApp());
}

Color currentColor = Color(0xff443a49);
bool authenticated = false;
var Selectedinput;
var dataa;
List<Widget> allgraph = [];
late SharedPreferences logindata;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    dataa;
    authb();
    super.initState();
    getCurrentAppTheme();
  }

  authb() async {
    logindata = await SharedPreferences.getInstance();
    if (logindata.getBool('auth') == true) {
      print('ok');
      _authenticate();
    } else {
      logindata.setBool('auth', false);
    }
  }

  final LocalAuthentication auth = LocalAuthentication();
  Future<bool> _authenticate() async {
    String _authorized = 'Not Authorized';
    bool _isAuthenticating = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      setState(() {
        _isAuthenticating = false;
      });
      print('auth');
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
    if (!mounted) {}
    if (_authorized == 'Not Authorized') {
      setState(() {
        exit(0);
      });
    }
    // if (authenticated == false) {
    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: ((context) {
    //         return AlertDialog(
    //           content: Text('$_authorized'),
    //         );
    //       }));
    // }
    return authenticated;
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
