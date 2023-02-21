import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integraphics/Screens/Schedule%20Notification/MyDay.dart';
import 'package:integraphics/Screens/settings.dart';
import 'package:integraphics/Services/themesetup/DarkThemeProvider.dart';
import 'package:integraphics/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Infographics.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool toggleval = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset('assets/images/IntegralGifLogo.gif'),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              ListTile(
                leading: Image(
                  image: AssetImage('assets/images/Home-Iocn.png'),
                  height: 25,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/Data-Analytics-icon.png',
                  ),
                  height: 25,
                ),
                title: const Text('Data Analytics'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/iTransformETL.png',
                  ),
                  height: 25,
                ),
                title: const Text('Data Integration'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/AnalyticsFeatures.png',
                  ),
                  height: 25,
                ),
                title: const Text('Analytics Features'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/BrainAIb.png',
                  ),
                  height: 25,
                ),
                title: const Text('Actionable Insights by AI'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/TransformFeatures.png',
                  ),
                  height: 25,
                ),
                title: const Text('Transform Features'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/innovationBulb.png',
                  ),
                  height: 25,
                ),
                title: const Text('DS Knowledge Base'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image(
                  image: AssetImage(
                    'assets/Pricing.png',
                  ),
                  height: 25,
                ),
                title: const Text('Pricing'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Settings(
                                con: context,
                              ))));
                },
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ExpansionTile(title: Text('Tools'), children: [
                ListTile(
                  title: Text('My Day'),
                  leading: Icon(Icons.alarm_add),
                  onTap: () {
                    Get.to(() => Reminder());
                  },
                ),
              ]),
            ]),
          )
        ],
      ),
    );
  }
}
