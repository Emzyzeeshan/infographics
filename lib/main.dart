import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:integraphics/Screens/Schedule%20Notification/services/notification_service.dart';
import 'package:integraphics/login/lg.dart';
import 'package:integraphics/widgets/unauthaccess.dart';
import 'package:local_auth/local_auth.dart';
import 'package:open_filex/open_filex.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Infographics.dart';
import 'Screens/Schedule Notification/details_page.dart';
import 'Services/themesetup/DarkThemeProvider.dart';
import 'Services/themesetup/styles.dart';
import 'login/loginPage.dart';
import 'login/newphonescreen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

Color currentColor = Color(0xff443a49);
bool authenticated = false;
var Selectedinput;
var dataa;
List<Widget> allgraph = [];
late SharedPreferences logindata;
GlobalKey keyButton1 = GlobalKey();
GlobalKey DashboardDropdownkey = GlobalKey();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    Notifyplugin();
    Future.delayed(Duration.zero, () async {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    });
    dataa;
    authb();
    getCurrentAppTheme();
    super.initState();
  }

  void Notifyplugin() async {
    var details = await NotificationService()
        .flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    final didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
    didNotificationLaunchApp
        ? await Get.to(
            DetailsPage(payload: details!.notificationResponse!.payload))
        : null;
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

    if (_authorized == 'Not Authorized') {
      setState(() {
        exit(0);
      });
    }

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
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
