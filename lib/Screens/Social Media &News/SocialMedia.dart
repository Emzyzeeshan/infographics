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
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Facebook.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Liveupdates.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/NewsChannel.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Newspaper.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Survey.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Twitter.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/Youtube.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SubNewspages/instagram.dart';
import 'package:integraphics/widgets/SocialnewsFilter.dart';
import 'package:lottie/lottie.dart';
import 'package:sidebarx/sidebarx.dart';

// SidebarXController _controller =
//     SidebarXController(selectedIndex: 0, extended: false);

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

  List<String> _Searchparty = ['CANADA'];
  List<String> _searchdistrict = [''];
  List<String> _SearchConstitution = ['Q1-2020'];
  List<String> _Opp = [''];
  List<String> _Industry = ['AUTOMOTIVE'];
  List<String> _FiscalYear = [''];

  ScrollController _scrollController = ScrollController();
  PageController? _controller = PageController();
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  bool isfolded = true;
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Builder(
      builder: (ctx) {
        return Scaffold(
          // backgroundColor: Color(0xffd7e2fe),
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: ctx,
                              builder: ((ctx) {
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
                                        title: 'Search Party',
                                        selectedValue: _Searchparty,
                                        onChange: (selected) => setState(() =>
                                            _Searchparty = selected.value),
                                        choiceItems: Searchparty,
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
                                        title: 'Search District',
                                        selectedValue: _SearchConstitution,
                                        onChange: (selected) {
                                          setState(() => _SearchConstitution =
                                              selected.value);
                                        },
                                        choiceItems: SearchDistrict,
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
                                        title: 'Search Constitition',
                                        selectedValue: _searchdistrict,
                                        onChange: (selected) => setState(() =>
                                            _searchdistrict = selected.value),
                                        choiceItems: SearchConstitution,
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
                                                  _SearchConstitution.clear();
                                                  _Searchparty.clear();
                                                  _searchdistrict.clear();
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
                        icon: Icon(
                          Icons.filter_alt_rounded,
                          color: Colors.black,
                        )),
                  ],
                  elevation: 0,
                  backgroundColor: Colors.white,
                  // backgroundColor: Color(0xffd7e2fe),
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
          body: ConnectivityWidgetWrapper(
            stacked: false,
            offlineWidget: Center(
                child: Lottie.asset(
              'assets/images/lostconnection.json',
            )),
            child: Column(
              children: [
                // Container(
                //   alignment: Alignment.topCenter,
                //   child: SimpleFoldingCell.create(
                //     key: _foldingCellKey,
                //     frontWidget: _buildFrontWidget(),
                //     innerWidget: _buildInnerWidget(),
                //     cellSize: Size(MediaQuery.of(context).size.width, 65),
                //     padding: EdgeInsets.all(10),
                //     animationDuration: Duration(milliseconds: 300),
                //     borderRadius: 10,
                //     onOpen: () {
                //       print('cell opened');
                //       setState(() {
                //         isfolded = false;
                //       });
                //     },
                //     onClose: () {
                //       setState(() {
                //         isfolded = true;
                //       });
                //       print('cell closed');
                //     },
                //   ),
                // ),
                NewsRow(
                    scrollController: _scrollController,
                    controller: _controller),

                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      NewsPaper(false),
                      NewsChannnel(false),
                      Survey(false),
                      LiveUpdates(false),
                      Twitter(false),
                      YouTube(false),
                      Facebook(false),
                      Instagram(false),
                    ],
                  ),
                ),
                // isvisible == true
                //     ? ExampleSidebarX(controller: _controller)
                //     : Container(),
                // if (!isSmallScreen)
                //   ExampleSidebarX(controller: _controller),
                // Expanded(
                //   child: Center(
                //     child: _ScreensExample(
                //       controller: _controller,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller!.jumpToPage(0);
                          },
                          child: Image.asset(
                            'assets/images/news2.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Text(
                          'NewsPaper',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller!.jumpToPage(1);
                          },
                          child: Image.asset(
                            'assets/newsdxps.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Text(
                          'News Channel',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller!.jumpToPage(2);
                          },
                          child: Image.asset(
                            'assets/images/survey2.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                        Text(
                          'Survey',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller!.jumpToPage(3);
                          },
                          child: Image.asset(
                            'assets/liveUpdares.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Text(
                          'live Updates',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              _foldingCellKey?.currentState?.toggleFold();
                            },
                            child: Icon(
                              Icons.arrow_circle_down_rounded,
                              size: 30,
                            )),
                        Text(
                          'Show more',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    )
                  ],
                )),
          ),
          // Positioned(
          //   top: 10,
          //   right: 10,
          //   bottom: 10,
          //   child: TextButton(
          //     onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          //     child: Text(
          //       "More",
          //     ),
          //     style: TextButton.styleFrom(
          //       backgroundColor: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildInnerWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 6),
      child: Stack(
        children: [
          // todo : 2nd line of open state
          isfolded == false
              ? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller!.jumpToPage(4);
                            },
                            child: Image.asset(
                              'assets/twitter.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text(
                            'Twitter',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller!.jumpToPage(5);
                            },
                            child: Image.asset(
                              'assets/yt.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text(
                            'YouTube',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller!.jumpToPage(6);
                            },
                            child: Image.asset(
                              'assets/fb.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text(
                            'FaceBook',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller!.jumpToPage(7);
                            },
                            child: Image.asset(
                              'assets/insta.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text(
                            'Instagram',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),

          //todo : 1st line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller!.jumpToPage(0);
                    },
                    child: Image.asset(
                      'assets/images/news2.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    'NewsPaper',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller!.jumpToPage(1);
                    },
                    child: Image.asset(
                      'assets/newsdxps.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    'News Channel',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller!.jumpToPage(2);
                    },
                    child: Image.asset(
                      'assets/images/survey2.png',
                      height: 32,
                      width: 32,
                    ),
                  ),
                  Text(
                    'Survey',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller!.jumpToPage(3);
                    },
                    child: Image.asset(
                      'assets/liveUpdares.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    'live Updates',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          isfolded == false
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () =>
                        _foldingCellKey?.currentState?.toggleFold(),
                    child: Text(
                      "Close",
                    ),
                    // style: TextButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    // ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class NewsRow extends StatelessWidget {
  const NewsRow({
    super.key,
    required ScrollController scrollController,
    required PageController? controller,
  })  : _scrollController = scrollController,
        _controller = controller;

  final ScrollController _scrollController;
  final PageController? _controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(0);
                },
                child: Image.asset(
                  'assets/images/news2.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'NewsPaper',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(1);
                },
                child: Image.asset(
                  'assets/newsdxps.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'News Channel',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(2);
                },
                child: Image.asset(
                  'assets/images/survey2.png',
                  height: 32,
                  width: 32,
                ),
              ),
              Text(
                'Survey',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(3);
                },
                child: Image.asset(
                  'assets/liveUpdares.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'live Updates',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(4);
                },
                child: Image.asset(
                  'assets/twitter.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'Twitter',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(5);
                },
                child: Image.asset(
                  'assets/yt.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'YouTube',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(6);
                },
                child: Image.asset(
                  'assets/fb.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'FaceBook',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller!.jumpToPage(7);
                },
                child: Image.asset(
                  'assets/insta.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                'Instagram',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class ExampleSidebarX extends StatelessWidget {
//   const ExampleSidebarX({
//     Key? key,
//     required SidebarXController controller,
//   })  : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Color(0xff6d96fa).withOpacity(0.3),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         hoverColor: scaffoldBackgroundColor,
//         textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
//         selectedTextStyle: const TextStyle(color: Colors.white),
//         itemTextPadding: const EdgeInsets.only(left: 30),
//         selectedItemTextPadding: const EdgeInsets.only(left: 30),
//         itemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: canvasColor),
//         ),
//         selectedItemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: actionColor.withOpacity(0.37),
//           ),
//           gradient: const LinearGradient(
//             colors: [accentCanvasColor, canvasColor],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.28),
//               blurRadius: 30,
//             )
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white.withOpacity(0.7),
//           size: 20,
//         ),
//         selectedIconTheme: const IconThemeData(
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//       extendedTheme: const SidebarXTheme(
//         width: 200,
//         decoration: BoxDecoration(
//           color: canvasColor,
//         ),
//       ),
//       footerDivider: divider,
//       headerBuilder: (context, extended) {
//         return SizedBox(
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Image.asset('assets/images/IntegralGifLogo.gif'),
//           ),
//         );
//       },
//       items: items,
//     );
//   }
// }

// class _ScreensExample extends StatefulWidget {
//   _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   State<_ScreensExample> createState() => _ScreensExampleState();
// }

// class _ScreensExampleState extends State<_ScreensExample> {
//   PageController pageController = PageController();
//   var setStateHandler;
//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//     setStateHandler = fn;
//     super.setState(fn);
//   }
//   // @override
//   // void initSetState(Function setState) {
//   //    = setState;
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: widget.controller,
//       builder: (context, child) {
//         // final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (widget.controller.selectedIndex) {
//           case 0:
//             return NewsPaper(_controller.extended);
//           case 1:
//             return NewsChannnel(_controller.extended);
//           case 2:
//             return LiveUpdates(_controller.extended);
//           case 3:
//             return Survey(
//               _controller.extended,
//             );
//           case 4:
//             return Twitter(_controller.extended);
//           case 5:
//             return YouTube(_controller.extended);
//           case 6:
//             return Facebook(_controller.extended);
//           case 7:
//             return Instagram(_controller.extended);
//           default:
//             return Text(
//               '',
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

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
