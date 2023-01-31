import 'package:flutter/material.dart';
import 'package:integraphics/Screens/Infographics.dart';
import 'package:integraphics/main.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class SociaMediaNews extends StatefulWidget {
  const SociaMediaNews({super.key});

  @override
  State<SociaMediaNews> createState() => _SociaMediaNewsState();
}

class _SociaMediaNewsState extends State<SociaMediaNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          child: Icon(Icons.restore_page),
          // closedForegroundColor: Color(0xff6d96fa),
          openForegroundColor: Colors.white,
          closedBackgroundColor: Color(0xff6d96fa),
          openBackgroundColor: Colors.black,
          // labelsStyle: /* Your label TextStyle goes here */
          labelsBackgroundColor: Colors.white,
          // controller: /* Your custom animation controller goes here */,
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              child: Icon(Icons.pie_chart),
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff6d96fa),
              label: 'InfoGraphics',
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => InfoGraphics(logindata))));
                });
              },
              closeSpeedDialOnPressed: false,
            ),
            SpeedDialChild(
              child: Icon(Icons.newspaper_rounded),
              foregroundColor: Colors.black,
              backgroundColor: Color(0xff6d96fa),
              label: 'Social Media & News Analysis',
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SociaMediaNews())));
                });
              },
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xff6d96fa),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Image.asset('assets/images/IntegralGifLogo.gif'),
                  ),
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: PopupMenuButton(
                        icon: Icon(Icons.change_circle_outlined),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Container(
                                  child: Text('Social Media & News Analysis')),
                            ),
                            PopupMenuItem(
                              child: Text('InfoGraphics'),
                            ),
                          ];
                        },
                      )),
                ],
              )
            ];
          },
          body: Container(),
        ));
  }
}
