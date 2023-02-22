import 'dart:convert';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:http/http.dart';
import 'package:integraphics/Constants/ChartScreenshotcontroller.dart';
import 'package:integraphics/Constants/ResponsiveSize.dart';
import 'package:integraphics/Screens/DropdownScreens/HT_Dashboard.dart';
import 'package:integraphics/Screens/DropdownScreens/Product%20_and_service_spend.dart';
import 'package:integraphics/Screens/DropdownScreens/Product_Dashboard.dart';
import 'package:integraphics/Screens/Schedule%20Notification/MyDay.dart';
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
  List<String> _fruit = ['CANADA'];
  List<String> _owner = [''];
  List<String> _framework = ['Q1-2020'];
  List<String> _Opp = [''];
  List<String> _Industry = ['AUTOMOTIVE'];
  List<String> _FiscalYear = [''];
  List<S2Choice<String>> FiscalYear = [
    S2Choice<String>(value: '2019', title: '2019'),
    S2Choice<String>(value: '2020', title: '2020'),
    S2Choice<String>(value: '2021', title: '2021'),
    S2Choice<String>(value: '2022', title: '2022'),
    S2Choice<String>(value: '2023', title: '2023'),
  ];
  List<S2Choice<String>> Industry = [
    S2Choice<String>(value: 'ALUMINIUM', title: 'ALUMINIUM FOUNDRIES'),
    S2Choice<String>(value: 'AUTOMOTIVE', title: 'AUTOMOTIVE'),
    S2Choice<String>(value: 'AVIATION', title: 'AVIATION'),
    S2Choice<String>(value: 'BANKING', title: 'BANKING'),
    S2Choice<String>(value: 'CEMENT', title: 'CEMENT'),
  ];
  List<S2Choice<String>> opp = [
    S2Choice<String>(value: 'BQ', title: 'BQ'),
    S2Choice<String>(value: 'CANCELLED', title: 'CANCELLED'),
    S2Choice<String>(value: 'DEALS LOST', title: 'DEALS LOST'),
    S2Choice<String>(value: 'DEALS WON', title: 'DEALS WON'),
    S2Choice<String>(value: 'DEMO', title: 'DEMO'),
  ];
  List<S2Choice<String>> Owner = [
    S2Choice<String>(value: 'AFSAR', title: 'AFSAR HUSSAIN'),
    S2Choice<String>(value: 'AISHA', title: 'AISHA MUBASHIRA'),
    S2Choice<String>(value: 'ERIC', title: 'ERIC VAN CASPEL'),
    S2Choice<String>(value: 'FOUAD', title: 'FOUAD AL-MAWLA'),
    S2Choice<String>(value: 'HENNIE', title: 'HENNIE KILIAN'),
  ];
  List<S2Choice<String>> country = [
    S2Choice<String>(value: 'BAHRAIN', title: 'BAHRAIN'),
    S2Choice<String>(value: 'CANADA', title: 'CANADA'),
    S2Choice<String>(value: 'CHILE', title: 'CHILE'),
    S2Choice<String>(value: 'EGYPT', title: 'EGYPT'),
    S2Choice<String>(value: 'INDIA', title: 'INDIA'),
  ];
  List<S2Choice<String>> FiscalPeriod = [
    S2Choice<String>(value: 'Q1-2019', title: 'Q1-2019'),
    S2Choice<String>(value: 'Q1-2020', title: 'Q1-2020'),
    S2Choice<String>(value: 'Q1-2021', title: 'Q1-2021'),
    S2Choice<String>(value: 'Q1-2022', title: 'Q1-2022'),
    S2Choice<String>(value: 'Q1-2023', title: 'Q1-2023'),
  ];

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig().init(context);
    bool toogle = false;
    final GlobalKey<AnimatedFloatingActionButtonState> key =
        GlobalKey<AnimatedFloatingActionButtonState>();
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();
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
                      actions: [
                        IconButton(
                          icon: Icon(Icons.filter_alt),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Color(0xff6d96fa),
                                      title: Text(
                                        'Filter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      centerTitle: true,
                                    ),
                                    body: Column(
                                      children: <Widget>[
                                        const SizedBox(height: 7),
                                        SmartSelect<String>.multiple(
                                          title: 'Country',
                                          selectedValue: _fruit,
                                          onChange: (selected) => setState(
                                              () => _fruit = selected.value),
                                          choiceItems: country,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        const Divider(
                                          indent: 20,
                                        ),
                                        SmartSelect<String>.multiple(
                                          title: 'Fiscal Period',
                                          selectedValue: _framework,
                                          onChange: (selected) {
                                            setState(() =>
                                                _framework = selected.value);
                                          },
                                          choiceItems: FiscalPeriod,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 7),
                                        SmartSelect<String>.multiple(
                                          title: 'Owner Full Name',
                                          selectedValue: _owner,
                                          onChange: (selected) => setState(
                                              () => _owner = selected.value),
                                          choiceItems: Owner,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        const Divider(
                                          indent: 20,
                                        ),
                                        SmartSelect<String>.multiple(
                                          title: 'Opp Stage Name',
                                          selectedValue: _Opp,
                                          onChange: (selected) {
                                            setState(
                                                () => _Opp = selected.value);
                                          },
                                          choiceItems: opp,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 7),
                                        SmartSelect<String>.multiple(
                                          title: 'Industry',
                                          selectedValue: _Industry,
                                          onChange: (selected) => setState(
                                              () => _Industry = selected.value),
                                          choiceItems: Industry,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 7),
                                        SmartSelect<String>.multiple(
                                          title: 'Fiscal Year',
                                          selectedValue: _FiscalYear,
                                          onChange: (selected) => setState(() =>
                                              _FiscalYear = selected.value),
                                          choiceItems: FiscalYear,
                                          modalType: S2ModalType.popupDialog,
                                          tileBuilder: (context, state) {
                                            return ListTile(
                                              tileColor: Colors.grey[100],
                                              title: Text(state.title ?? ''),
                                              subtitle: Text(
                                                state.selected.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.grey,
                                              ),
                                              onTap: state.showModal,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              MaterialButton(
                                                onPressed: () {},
                                                child: Text('Apply'),
                                                color: Color(0xff6d96fa),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _FiscalYear.clear();
                                                    _Industry.clear();
                                                    _Opp.clear();
                                                    _framework.clear();
                                                    _fruit.clear();
                                                    _owner.clear();
                                                  });
                                                },
                                                child: Text('Reset'),
                                                color: Color(0xff6d96fa),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          },
                        ),
                      ],
                      elevation: 0,
                      backgroundColor: Color(0xff6d96fa),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Image.asset(
                              'assets/images/IntegralGifLogo.gif',
                              color: Colors.white,
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
                      : DeviceSizeConfig.screenHeight! * 0.095,
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
                    padding: const EdgeInsets.only(top: 0.0),
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
                                  return const Text('Data Error');
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
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: data['dashBordlist']
                                            .map<DropdownMenuItem<String>>(
                                                (item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item.toString(),
                                                        style: const TextStyle(
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
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        scrollbarAlwaysShow: true,
                                        offset: const Offset(-20, 0),
                                        isDense: true,
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Text('Server Error');
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
              ]))),
    );
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
