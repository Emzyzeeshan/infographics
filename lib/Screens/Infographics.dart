import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:integraphics/Constants/ResponsiveSize.dart';
import 'package:integraphics/widgets/CircularLoader.dart';
import 'package:integraphics/widgets/Drawer.dart';

import '../Logout/logout.dart';
import '../widgets/DropdownWidgets.dart';
import 'DropdownScreens/APC_Rehan.dart';
import 'DropdownScreens/Cardwidget.dart';
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
    super.initState();
  }

  late Future<dynamic> finaldata = DropdownApi();

  var DropdownApidata;
  var data;
  var data1;
  String? selectedValue;

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          drawer: drawer(),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Logout(widget.logindata),
              ),
            ],
            backgroundColor: Color(0xff6d96fa),
            title: Text(
              'Info Graphics',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(children: [
            Container(
              height: DeviceSizeConfig.screenHeight! * 0.1,
              decoration: BoxDecoration(
                color: Color(0xff6d96fa),
              ),
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
                                  hint: Text(
                                    'ok',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: data['dashBordlist']
                                      .map<DropdownMenuItem<String>>(
                                          (item) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                      print(selectedValue);
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
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.grey[200],
                                  ),
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownPadding: null,
                                  dropdownElevation: 8,
                                  dropdownOverButton: true,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  dropdownFullScreen: false,
                                  dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  dropdownMaxHeight:
                                      MediaQuery.of(context).size.height * 0.5,
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
                          return Text('State: ${snapshot.connectionState}');
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: custompage(),
                // FutureBuilder<dynamic>(
                //   future: data['dashBordlist'],
                //   builder: (
                //     BuildContext context,
                //     snapshot,
                //   ) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return CircularProgressIndicator();
                //     } else if (snapshot.connectionState ==
                //         ConnectionState.done) {
                //       if (snapshot.hasError) {
                //         return const Text('Error');
                //       } else if (snapshot.hasData) {
                //         return custompage();
                //       } else {
                //         return const Text('Empty data');
                //       }
                //     } else {
                //       return Text('State: ${snapshot.connectionState}');
                //     }
                //   },
                // ),

                // PageView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     controller: pageController,
                //     onPageChanged: (value) {
                //       setState(() {
                //         if (value == null) {
                //           print('nullll');
                //         }
                //       });
                //     },
                //     itemCount: containers.length,
                //     itemBuilder: ((context, count) => Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: data == null
                //               ? Center(child: buildBody())
                //               : containers[count + 1],
                //         )))
              ),
            ),
          ])),
    );
  }

  Widget custompage() {
    var customwid;

    switch (selectedValue) {
      case 'CRM':
        setState(() {
          customwid = HR_DashBoard();
        });

        break;
      case 'Cards Save Test':
        allinoneAPI();

        customwid = AB(data1);

        break;
      case 'Currency Charts':
        setState(() {
          customwid = CI_Tree();
        });

        break;
      case 'Demand & Supply':
        setState(() {
          customwid = DemandSupply();
        });

        break;
      case 'HR Dashboard':
        setState(() {
          customwid = Apc_Rehan_Widget();
        });
        break;
      default:
        setState(() => customwid = Container());
    }

    return customwid;
  }
//note: Api call for Dropdown element of infographics

  Future<dynamic> DropdownApi() async {
    await Future.delayed(Duration(seconds: 1));
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
        selectedValue = data['dashBordlist'][0];
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
    var body = json.encode({"dashbordname": "$selectedValue"});
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
