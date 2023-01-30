import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:integraphics/Screens/Infographics.dart';

import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/unauthaccess.dart';
import 'package:local_auth/local_auth.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../Screens/DropdownScreens/HR_Dashboard.dart';

import 'lg.dart';
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

  bool? newuser;
  var userDetails;
  // late bool authenticated;
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => InfoGraphics(logindata)));
    }
  }

  // _SupportState _supportState = _SupportState.unknown;
  @override
  initState() {
    userNameText.text = 'sasi_mgr';
    passWordText.text = 'P@ssw0rd';
    check_if_already_login();
    super.initState();
    // auth.isDeviceSupported().then(
    //       (bool isSupported) => setState(() => _supportState = isSupported
    //           ? _SupportState.supported
    //           : _SupportState.unsupported),
    //     );
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height * .55),
                          _usernameWidget(),
                          const SizedBox(height: 20),
                          _passwordwidget(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _submitButton(),
                      ],
                    ),
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

  final ValueNotifier<bool> popup = ValueNotifier<bool>(false);
  bool isloading = false;
  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ValueListenableBuilder<bool>(
            valueListenable: popup,
            builder: (context, value, _) {
              return popup.value
                  ? SpinKitSpinningLines(
                      lineWidth: 5,
                      size: 50,
                      color: Color(0xff6d96fa),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          popup.value = true;
                        });
                        await Future.delayed(Duration(seconds: 2));
                        // setState(() {
                        //   userName = userNameText.text;
                        //   passWord = passWordText.text;
                        // });
                        Verify();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        backgroundColor: Color(0xFF2661FA),
                        shape: StadiumBorder(),
                      ),
                      /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),*/
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }),
      ),
    );
  }

  Future<dynamic> Verify() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var res = await post(Uri.parse('http://192.169.1.211:8082/user/login'),
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
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            islogin = false;
          });
        else {
          var login = response['rsUsername'] ?? '';
          if (userNameText.text.toUpperCase() == login) {
            islogin = true;
            userDetails = {
              'userName': userNameText.text.toUpperCase(),
            };

            print(response);

            String username = userNameText.text;
            String password = passWordText.text;
            if (username != '' && password != '') {
              print('Successfull');
              logindata.setBool('login', false);
              logindata.setString('username', username.toUpperCase());
              logindata.setString('password', password);

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
          onConfirmBtnTap: () {
            setState(() {
              popup.value = false;
              // isloading == false;
              // this.isloading;

              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: ((context) => LoginPage())));
            });
            Navigator.pop(context);
          });
    }
  }
}
