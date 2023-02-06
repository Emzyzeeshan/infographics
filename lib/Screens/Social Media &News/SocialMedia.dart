// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:integraphics/Screens/Infographics.dart';
// import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/NewsChannel.dart';
// import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Newspaper.dart';
// import 'package:integraphics/main.dart';
// import 'package:integraphics/widgets/Drawer.dart';
// import 'package:preload_page_view/preload_page_view.dart';
// import 'package:sidebarx/sidebarx.dart';
// import 'package:simple_speed_dial/simple_speed_dial.dart';

// class SociaMediaNews extends StatefulWidget {
//   const SociaMediaNews({super.key});

//   @override
//   State<SociaMediaNews> createState() => _SociaMediaNewsState();
// }

// class _SociaMediaNewsState extends State<SociaMediaNews> {
//   double curveHeight = 50.0;
//   List<Widget> pages = [NewsPaper(), NewsChannel()];
//   List<String> headings = [
//     'News Paper',
//     'Live News',
//     'Survey',
//     'Live Updates',
//     'trends',
//     'Polls',
//     'Twitter',
//     'Youtube'
//   ];
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async => false,
//         child: Scaffold(
//             drawer: SidebarX(
//               controller: SidebarXController(selectedIndex: 0, extended: true),
//               items: const [
//                 SidebarXItem(icon: Icons.home, label: 'Home'),
//                 SidebarXItem(icon: Icons.search, label: 'Search'),
//               ],
//             ),
//             appBar: AppBar(
//               flexibleSpace: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 28.0),
//                     child: Image.asset('assets/images/IntegralGifLogo.gif'),
//                   ),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         colors: [
//                           Color(0xff6d96fa),
//                           Color(0xffd7e2fe),
//                         ],
//                         begin: const FractionalOffset(0.0, 0.0),
//                         end: const FractionalOffset(1.0, 0.0),
//                         stops: [0.0, 1.0],
//                         tileMode: TileMode.clamp),
//                   )),

//               backgroundColor: Color(0xff6d96fa),
//               // shape: MyShapeBorder(curveHeight),
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${headings[count]}',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                         letterSpacing: 3),
//                   ),
//                   Container(
//                     child: GridView.count(
//                       shrinkWrap: true,
//                       childAspectRatio: 2 / 1.79,
//                       crossAxisSpacing: 3,
//                       mainAxisSpacing: 3,
//                       crossAxisCount: 4,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/newspaper.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                             ),
//                             Text('News Paper')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/livenews.png",
//                                 height: 50,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Live News')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/survey.jpg",
//                                 height: 50,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Survey')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/twitter.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Twitter')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/googleTrends1.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Trends')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/statistics.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Polls')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/twitter.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Twitter')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               child: Center(
//                                   child: Image.asset(
//                                 "assets/yt.png",
//                                 height: 30,
//                               )),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[100],
//                               ),
//                               /*child: Center(
//                                     child: Image.asset("assets/Image/Government_of_Telangana_Logo.png")
//                                   ) */
//                             ),
//                             Text('Youtube'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Flexible(
//                       child: PageView.builder(
//                           itemCount: 2,
//                           itemBuilder: (BuildContext, index) {
//                             return Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.red,
//                               ),
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.height * 0.55,
//                             );
//                           })),
//                 ],
//               ),
//             )));
//   }
// }

// class MyShapeBorder extends ContinuousRectangleBorder {
//   const MyShapeBorder(this.curveHeight);
//   final double curveHeight;

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
//     ..lineTo(0, rect.size.height)
//     ..quadraticBezierTo(
//       rect.size.width / 2,
//       rect.size.height + curveHeight * 2,
//       rect.size.width,
//       rect.size.height,
//     )
//     ..lineTo(rect.size.width, 0)
//     ..close();
// }
import 'package:flutter/material.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Facebook.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Liveupdates.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/NewsChannel.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Newspaper.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Survey.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Twitter.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Youtube.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/instagram.dart';
import 'package:sidebarx/sidebarx.dart';

SidebarXController _controller =
    SidebarXController(selectedIndex: 0, extended: false);

class SidebarXExampleApp extends StatefulWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  @override
  State<SidebarXExampleApp> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<SidebarXExampleApp> {
  final _key = GlobalKey<ScaffoldState>();
  bool isvisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primaryColor: primaryColor,
          // canvasColor: canvasColor,
          // scaffoldBackgroundColor: scaffoldBackgroundColor,
          // textTheme: const TextTheme(
          //   headlineSmall: TextStyle(
          //     color: Colors.white,
          //     fontSize: 46,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
          ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            backgroundColor: Color(0xffd7e2fe),
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    actions: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          icon: Icon(
                            Icons.reset_tv_rounded,
                            color: Colors.black,
                          ))
                    ],
                    elevation: 0,
                    backgroundColor: Color(0xffd7e2fe),
                    centerTitle: true,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Image.asset(
                        'assets/images/IntegralGifLogo.gif',
                        height: 40,
                        width: 100,
                      ),
                    ),
                    // flexibleSpace: Container(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //         colors: [
                    //           Color(0xff6d96fa),
                    //           Color(0xffd7e2fe),
                    //         ],
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //         stops: [0.0, 1.0],
                    //         tileMode: TileMode.clamp),
                    //   ),
                    // ),
                  )
                : null,
            body: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  isvisible == true
                      ? ExampleSidebarX(controller: _controller)
                      : Container(),
                  // if (!isSmallScreen)
                  //   ExampleSidebarX(controller: _controller),
                  Expanded(
                    child: Center(
                      child: _ScreensExample(
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff6d96fa).withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/IntegralGifLogo.gif'),
          ),
        );
      },
      items: items,
    );
  }
}

class _ScreensExample extends StatefulWidget {
  _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  PageController pageController = PageController();
  var setStateHandler;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    setStateHandler = fn;
    super.setState(fn);
  }
  // @override
  // void initSetState(Function setState) {
  //    = setState;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        // final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return NewsPaper(_controller.extended);
          case 1:
            return NewsChannnel(_controller.extended);
          case 2:
            return LiveUpdates(_controller.extended);
          case 3:
            return Survey(_controller.extended, context, setStateHandler);
          case 4:
            return Twitter(_controller.extended);
          case 5:
            return YouTube(_controller.extended);
          case 6:
            return Facebook(_controller.extended);
          case 7:
            return Instagram(_controller.extended);
          default:
            return Text(
              '',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

List<SidebarXItem> items = [
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/newspaperdxp.png",
      height: 30,
      color: Colors.white,
    ),
    // icon: Icons.home,
    label: 'News Paper',
    onTap: () {
      debugPrint('Home');
    },
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/newsdxps.png",
      height: 30,
      color: Colors.white,
    ),
    label: 'News Channel',
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/liveUpdares.png",
      height: 30,
      // color: Colors.white,
    ),
    label: 'Live Updates',
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/surveydxp.png",
      height: 30,
      color: Colors.white,
    ),
    label: 'Survey',
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/twitter.png",
      height: 30,
    ),
    // icon: Icons.home,
    label: 'Twitter',
    onTap: () {
      debugPrint('Home');
    },
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/yt.png",
      height: 30,
      // color: Colors.white,
    ),
    label: 'YouTube',
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/fb.png",
      height: 30,
      // color: Colors.white,
    ),
    label: 'Facebook',
  ),
  SidebarXItem(
    iconWidget: Image.asset(
      "assets/insta.png",
      height: 30,
      // color: Colors.white,
    ),
    label: 'Instagram',
  ),
];
// String _getTitleByIndex(int index) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Search';
//     case 2:
//       return 'People';
//     case 3:
//       return 'Favorites';
//     case 4:
//       return 'Custom iconWidget';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Settings';
//     default:
//       return 'Not found page';
//   }
// }

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
