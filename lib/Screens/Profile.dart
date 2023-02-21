import 'package:flutter/material.dart';
import 'package:integraphics/main.dart';
import 'package:settings_ui/settings_ui.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text(
          '${logindata.getString('username')}',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: SettingsList(sections: [
            SettingsSection(tiles: [
              SettingsTile.navigation(
                title: Text('My Cart'),
                leading: Image.asset('assets/shopping-Cart-Icon.png'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                title: Text('My Subscriptions'),
                leading: Image.asset('assets/subscription.png'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                title: Text('My Transactions'),
                leading: Image.asset('assets/transaction.png'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                title: Text('My Wallet'),
                leading: Image.asset('assets/wallet.png'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                title: Text('My Workspace'),
                leading: Image.asset('assets/workspace.png'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                title: Text('Workspace Analytics'),
                leading: Image.asset('assets/analyticsShowCard.png'),
                onPressed: (BuildContext context) {},
              ),
            ])
          ]),
        )
      ]),
    );
  }
}
