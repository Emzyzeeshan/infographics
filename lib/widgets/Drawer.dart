import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Infographics.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

SharedPreferences? logindata;

class _drawerState extends State<drawer> {
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
                'assets/images/Master_Detail_Editable.png',
              ),
              height: 25,
            ),
            title: const Text('Analytics Features'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.graphic_eq_sharp,
            ),
            title: const Text('Info Graphics'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => InfoGraphics(logindata))));
            },
          ),
        ],
      ),
    );
  }
}
