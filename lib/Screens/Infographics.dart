import 'dart:convert';
import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integraphics/Constants/ChartScreenshotcontroller.dart';
import 'package:integraphics/Constants/ResponsiveSize.dart';
import 'package:integraphics/Screens/DropdownScreens/HT_Dashboard.dart';
import 'package:integraphics/Screens/DropdownScreens/Product%20_and_service_spend.dart';
import 'package:integraphics/Screens/DropdownScreens/Product_Dashboard.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SocialMedia.dart';
import 'package:integraphics/Screens/testpage.dart';
import 'package:integraphics/Services/themesetup/DarkThemeProvider.dart';
import 'package:integraphics/widgets/CircularLoader.dart';
import 'package:integraphics/widgets/Drawer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../Logout/logout.dart';
import '../main.dart';

import 'DropdownScreens/HR_Dashboard.dart';

import 'DropdownScreens/CRM.dart';
import 'DropdownScreens/Demand&Supply.dart';

class InfoGraphics extends StatefulWidget {
  var logindata;
  InfoGraphics(this.logindata, {super.key});

  @override
  State<InfoGraphics> createState() => _InfoGraphicsState();
}

class _InfoGraphicsState extends State<InfoGraphics> {
  @override
  void initState() {
    print(result);
    super.initState();
  }

  late Future<dynamic> finaldata = DropdownApi();
  Future<bool> result = InternetConnectionChecker().hasConnection;
  var DropdownApidata;
  var data;
  var data1;

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig().init(context);
    bool toogle = false;
    final GlobalKey<AnimatedFloatingActionButtonState> key =
        GlobalKey<AnimatedFloatingActionButtonState>();
    ScrollController? scrollController = ScrollController();
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            drawer: drawer(),
            body: NestedScrollView(
                controller: scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        elevation: 0,
                        backgroundColor: Color(0xff6d96fa),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Image.asset(
                                'assets/images/IntegralGifLogo.gif',
                                height: 30,
                                width: 100,
                              ),
                            ),
                          ),
                        ))
                  ];
                },
                body: Column(children: [
                  Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? DeviceSizeConfig.screenHeight! * 0.2
                        : DeviceSizeConfig.screenHeight! * 0.14,
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: FutureBuilder(
                              future: finaldata,
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Align(
                                      alignment: Alignment.bottomCenter,
                                      child: buildBody());
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return const Text('Error');
                                  } else if (snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          key: DashboardDropdownkey,
                                          hint: Text(
                                            'ok',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: data['dashBordlist']
                                              .map<DropdownMenuItem<String>>(
                                                  (item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item.toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ))
                                              .toList(),
                                          value: Selectedinput,
                                          onChanged: (value) {
                                            setState(() {
                                              Selectedinput = value;
                                              print(Selectedinput);
                                              Selectedinput = Selectedinput;
                                              // pageController.jumpToPage(
                                              //     data['dashBordlist']
                                              //         .indexOf(selectedValue));
                                              // print(data['dashBordlist']
                                              //     .indexOf(selectedValue));
                                            });
                                          },
                                          buttonHeight: 50,
                                          buttonWidth:
                                              MediaQuery.of(context).size.width,
                                          itemHeight: 40,
                                          iconSize: 14,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.grey[200],
                                          ),
                                          itemPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownPadding: null,
                                          dropdownElevation: 8,
                                          dropdownOverButton: true,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          dropdownFullScreen: false,
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          dropdownMaxHeight:
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                          isDense: true,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Text('Empty data');
                                  }
                                } else {
                                  return Text(
                                      'State: ${snapshot.connectionState}');
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: HR_Dashboard(),
                    ),
                  ),
                ]))));
  }

  // Widget custompage() {
  //   var customwid;

  //   switch (Selectedinput) {
  //     case 'CRM':
  //       setState(() {
  //         customwid = HR_Dashboard();
  //       });

  //       break;
  //     case 'HT':
  //       customwid = HR_Dashboard();

  //       break;
  //     case 'Products':
  //       setState(() {
  //         customwid = HR_Dashboard();
  //       });

  //       break;
  //     case 'Demand & Supply':
  //       setState(() {
  //         customwid = HR_Dashboard();
  //       });

  //       break;
  //     case 'HR Dashboard':
  //       setState(() {
  //         customwid = HR_Dashboard();
  //       });
  //       break;
  //     case 'Product and Service Spend':
  //       setState(() {
  //         customwid = HR_Dashboard();
  //       });
  //       break;
  //     default:
  //       setState(() => customwid = Container());
  //   }

  //   return customwid;
  // }
//note: Api call for Dropdown element of infographics

  Future<dynamic> DropdownApi() async {
    // await Future.delayed(Duration(seconds: 1));
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({});
    var response = await post(
      Uri.parse('http://192.169.1.211:8080/smartBi/smartIntBi/getChartData'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      setState(() {
        DropdownApidata = response.body;
        data = jsonDecode(response.body);
        Selectedinput = data['dashBordlist'][0];
      });

      // print(data);
      print(data['dashBordlist']);
    } else {
      print(response.reasonPhrase);
    }
    return data;
  }

  allinoneAPI() async {
    // await Future.delayed(Duration(seconds: 1));
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"dashbordname": "$Selectedinput"});
    var response = await post(
      Uri.parse('http://192.169.1.211:8080/smartBi/smartIntBi/getChartCards'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      setState(() {
        DropdownApidata = response.body;
        data1 = jsonDecode(response.body);
      });

      // print(data);
      print(data1);
    } else {
      print(response.reasonPhrase);
    }
  }
}
