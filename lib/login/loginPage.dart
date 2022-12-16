import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:integraphics/Screens/Infographics.dart';
import 'package:quickalert/quickalert.dart';

import '../Screens/DropdownScreens/HR_Dashboard.dart';

import 'widget/loginContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameText = TextEditingController();

  TextEditingController passWordText = TextEditingController();
  String userName = '', passWord = '';
  bool userError = false, showPasswordField = false, passError = false;
  bool _visible = true;
  bool islogin = false;
  SharedPreferences? logindata;
  bool? newuser;
  var userDetails;
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => InfoGraphics(logindata)));
    }
  }

  @override
  initState() {
    check_if_already_login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(height: height * 0.43, child: const LoginContainer()),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * .55),
                          _usernameWidget(),
                          const SizedBox(height: 20),
                          _passwordwidget(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _submitButton(),
                    SizedBox(height: height * .035),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//UserName Field
  Widget _usernameWidget() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: 'User Name',
        isDense: true,
        fillColor: Color(0xffd7e2fe),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      controller: userNameText,
    );
  }

// Password Field
  Widget _passwordwidget() {
    return TextFormField(
      obscureText: _visible,
      style: TextStyle(color: Colors.black87),
      onChanged: (value) {},
      controller: passWordText,
      decoration: InputDecoration(
        hintText: 'Password',
        isDense: true,
        fillColor: Color(0xffd7e2fe),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _visible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _visible = !_visible;
            });
          },
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () async {
            // setState(() {
            //   userName = userNameText.text;
            //   passWord = passWordText.text;
            // });
            try {
              final result = await InternetAddress.lookup('example.com');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                var res = await post(
                    Uri.parse('http://192.169.1.211:8085/user/login'),
                    body: jsonEncode({
                      "rsUsername": userNameText.text.toUpperCase(), //userName
                      "rsPassword": passWordText.text, //passWord
                    }),
                    headers: {
                      'Content-Type': 'application/json',
                    });
                var response = jsonDecode(res.body);
                if (response['error'] == "Username Incorrect") {
                  setState(() {
                    final snackBar = SnackBar(
                      content: const Text('Username Incorrect'),
                      backgroundColor: (Colors.redAccent),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    islogin = false;
                  });
                } else if (response['error'] == "Password Incorrect")
                  setState(() {
                    final snackBar = SnackBar(
                      content: const Text('Password Incorrect'),
                      backgroundColor: (Colors.redAccent),
                      // action: SnackBarAction(
                      //   label: 'dismiss',
                      //   onPressed: () {},
                      // ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    islogin = false;
                  });
                // else if (response['ERROR_MESG'] ==
                //     "Oops Login Failed, Username or Password is wrong.")
                //   setState(() {
                //     final snackBar = SnackBar(
                //       content: const Text(
                //           'Oops Login Failed, Username or Password is wrong.'),
                //       backgroundColor: (Colors.redAccent),
                //       // action: SnackBarAction(
                //       //   label: 'dismiss',
                //       //   onPressed: () {},
                //       // ),
                //     );
                //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //     passError = true;
                //     islogin = false;
                //   });
                else {
                  var login = response['rsUsername'] ?? '';
                  if (userNameText.text.toUpperCase() == login) {
                    islogin = true;
                    userDetails = {
                      'userName': userNameText.text.toUpperCase(),
                    };

                    print(response);
                    //print(userDetails);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             HomePageScreen(
                    //                 //userDetails,
                    //                 )));
                    String username = userNameText.text;
                    String password = passWordText.text;
                    if (username != '' && password != '') {
                      print('Successfull');
                      logindata!.setBool('login', false);
                      logindata!.setString('username', username.toUpperCase());
                      logindata!.setString('password', password);
                      // logindata!.setString('role', response['ssRole']);
                      // logindata!.setString('ssLocale', response['ssLocale']);
                      // logindata!.setString('ssRegion', response['ssRegion']);
                      // logindata!.setString('ssOrgname', response['ssOrgname']);
                      // await showLoaderDialog(context);
                      await Fluttertoast.showToast(
                          msg: "Welcome",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Color(0xff29378f),
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => InfoGraphics(logindata))));
                    }

                    setState(() {
                      userName = '';
                      passWord = '';
                      userError = false;
                      passError = false;
                    });
                  } else
                    setState(() {
                      userError = true;
                      islogin = false;
                    });
                }
              }
            } on SocketException catch (_) {
              islogin = false;
              print('not connected');

              return await QuickAlert.show(
                animType: QuickAlertAnimType.slideInUp,
                backgroundColor: Colors.white,
                context: context,
                type: QuickAlertType.error,
                title: 'Oops...',
                text: 'Please Check Your Internet!!',
                confirmBtnColor: Color(0xff5163da),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            backgroundColor: Color(0xFF2661FA),
            shape: StadiumBorder(),
          ),
          /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),*/
          child: Container(
            child: Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
