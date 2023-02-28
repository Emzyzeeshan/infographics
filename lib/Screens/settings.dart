import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:integraphics/Constants/ChartScreenshotcontroller.dart';
import 'package:integraphics/Constants/ResponsiveSize.dart';
import 'package:integraphics/Logout/logout.dart';
import 'package:integraphics/Screens/Profile.dart';
import 'package:integraphics/Services/themesetup/DarkThemeProvider.dart';
import 'package:integraphics/login/loginPage.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/Drawer.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  BuildContext? con;
  Settings({this.con, super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
    Selectedinput;
    pieScreeshotcontroller1;
    pieScreeshotcontroller2;
    pieScreeshotcontroller3;
    pieScreeshotcontroller4;
    pieScreeshotcontroller5;
    pieScreeshotcontroller6;
    pieScreeshotcontroller7;
    pieScreeshotcontroller8;
    pieScreeshotcontroller9;
    pieScreeshotcontroller10;
    super.dispose();
  }

  bool isSwitched = false;
  List<bool> isSelected = [];
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff6d96fa),
                  Color(0xffd7e2fe),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        backgroundColor: Color(0xff6d96fa),
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('General'),
                  tiles: [
                    SettingsTile.navigation(
                      title: Text('Profile'),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: (BuildContext context) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                    ),
                    SettingsTile(
                      title: Text('Language'),
                      trailing: Text('English'),
                      leading: Icon(Icons.language),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      title: Text('Use Dark Mode'),
                      leading: Icon(Icons.phone_android),
                      initialValue: themeChange.darkTheme,
                      onToggle: (value) {
                        setState(() {
                          themeChange.darkTheme = value;
                        });
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  // titlePadding: EdgeInsets.all(20),
                  title: Text('Security'),
                  tiles: [
                    SettingsTile(
                      title: Text('Security'),
                      // title: 'Fingerprint',
                      leading: Icon(Icons.lock),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      title: Text('Screen Lock'),
                      description: Text('Uses Phone Biometrics'),
                      leading: Icon(Icons.fingerprint),
                      initialValue: logindata.getBool('auth') == null
                          ? false
                          : logindata.getBool('auth')!,
                      onToggle: (value) {
                        setState(() {
                          logindata.setBool('auth', value);
                        });
                        print(logindata.getBool('auth'));
                      },
                    ),
                  ],
                ),
                SettingsSection(
                    // titlePadding: EdgeInsets.all(20),
                    title: Text('Account Actions'),
                    tiles: [
                      SettingsTile.navigation(
                        title: Text('Logout'),
                        trailing: Icon(Icons.logout),
                        onPressed: (context) async {
                          await CoolAlert.show(
                            context: context,
                            type: CoolAlertType.confirm,
                            onConfirmBtnTap: () => LogoutAPI(
                                logindata.getString('username').toString(),
                                widget.con!),
                          );
                        },
                      ),
                      SettingsTile.navigation(
                        title: Text('About Us'),
                        trailing: Icon(Icons.question_mark_outlined),
                        onPressed: (context) {},
                      )
                    ]),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50, top: 50, bottom: 30),
              child: GridView.count(
                  crossAxisSpacing: 35,
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                            'https://www.facebook.com/profile.php?id=100087005881195');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/fb.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                            'https://www.instagram.com/integralanalytics/');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/insta.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                            'https://www.instagram.com/integralanalytics/');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/linkedIn.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri _url =
                            Uri.parse('https://twitter.com/integral_ana');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/twitter.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri _url = Uri.parse(
                            'https://www.youtube.com/channel/UC0bkzl0wBcx1r9qtqgOzt6Q');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/yt.png'),
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text('Copyright © 2023 integral'),
          )
        ],
      ),
    );
  }

  LogoutAPI(String username, BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"rsUsername": "$username"});
    var response = await post(
      Uri.parse('https://ifar.pilogcloud.com/appUserlogout'),
      headers: headers,
      body: body,
    );
    if (response.body == 'Success') {
      print(response.body);
      logindata.setBool('login', true);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));

      await Fluttertoast.showToast(
          msg: "ThankYou",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromRGBO(11, 74, 153, 1),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
    return response;
  }
}
