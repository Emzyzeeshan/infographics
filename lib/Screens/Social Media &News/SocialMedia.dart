import 'package:flutter/material.dart';
import 'package:integraphics/Screens/Infographics.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/NewsChannel.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Newspaper.dart';
import 'package:integraphics/main.dart';
import 'package:integraphics/widgets/Drawer.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class SociaMediaNews extends StatefulWidget {
  const SociaMediaNews({super.key});

  @override
  State<SociaMediaNews> createState() => _SociaMediaNewsState();
}

class _SociaMediaNewsState extends State<SociaMediaNews> {
  double curveHeight = 50.0;
  List<Widget> pages = [NewsPaper(), NewsChannel()];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            drawer: drawer(),
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
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Image.asset('assets/images/IntegralGifLogo.gif'),
                ),
              ),
              backgroundColor: Color(0xff6d96fa),
              shape: MyShapeBorder(curveHeight),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                )
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: PreloadPageView.builder(
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: pages[index],
                    );
                  }),
                  onPageChanged: (int position) {},
                  preloadPagesCount: 3,
                  controller: PreloadPageController(),
                ),
              ),
            )));
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
