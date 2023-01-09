import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:integraphics/Constants/ChartScreenshotcontroller.dart';
import 'package:integraphics/login/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  var logindata;
  Logout(this.logindata, {super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  late SharedPreferences logindata = widget.logindata;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.power_settings_new_outlined),
      onPressed: () {
        LogoutAPI(logindata.getString('username').toString());
      },
    );
  }

  LogoutAPI(String username) async {
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"rsUsername": "$username"});
    var response = await post(
      Uri.parse('https://imdrm.pilogcloud.com/V10/appUserlogout'),
      headers: headers,
      body: body,
    );

    if (response.body == 'Success') {
      print(response.body);
      logindata.setBool('login', true);
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
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
