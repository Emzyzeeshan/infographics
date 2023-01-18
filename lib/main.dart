import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integraphics/login/lg.dart';
import 'package:integraphics/widgets/unauthaccess.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'Screens/Infographics.dart';
import 'Services/themesetup/DarkThemeProvider.dart';
import 'Services/themesetup/styles.dart';
import 'login/loginPage.dart';
import 'login/newphonescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Color currentColor = Color(0xff443a49);
bool authenticated = false;
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
    _authenticate();
    super.initState();
    getCurrentAppTheme();
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
