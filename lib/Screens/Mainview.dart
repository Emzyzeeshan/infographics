import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:integraphics/Screens/Infographics.dart';
import 'package:integraphics/Screens/Slidelistview.dart';
import 'package:integraphics/Screens/Social%20Media%20&News/SocialMedia.dart';
import 'package:integraphics/main.dart';
import 'package:is_first_run/is_first_run.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _createTargets();
    // print(logindata.getBool('login'));
    // logindata.getBool('login') == false
    //     ? Future.delayed(Duration.zero, showTutorial)
    //     : null;
  }

  Future<bool> firstRun = IsFirstRun.isFirstRun();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent[50],
        body: SlideListView(
          floatingActionButtonColor: Color(0xff6d96fa),
          showFloatingActionButton: false,
          view1: InfoGraphics(logindata),
          view2: SidebarXExampleApp(),
          enabledSwipe: true,
        ));
  }

  // List<TargetFocus> targets = [];
  // void showTutorial() {
  //   TutorialCoachMark(
  //     targets: targets, // List<TargetFocus>
  //     colorShadow: Colors.green.shade200, // DEFAULT Colors.black
  //     // alignSkip: Alignment.bottomRight,
  //     // textSkip: "SKIP",
  //     // paddingFocus: 10,
  //     // opacityShadow: 0.8,
  //     onClickTarget: (target) {
  //       print(target);
  //     },
  //     onClickTargetWithTapPosition: (target, tapDetails) {
  //       print("target: $target");
  //       print(
  //           "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
  //     },
  //     onClickOverlay: (target) {
  //       print(target);
  //     },
  //     onSkip: () {
  //       print("skip");
  //     },
  //     onFinish: () {
  //       print("finish");
  //     },
  //   )..show(context: context);
  // }

  // List<TargetFocus> _createTargets() {
  //   targets.add(
  //     TargetFocus(
  //       identify: "keyButton1",
  //       keyTarget: keyButton1,
  //       alignSkip: Alignment.topRight,
  //       contents: [
  //         TargetContent(
  //           align: ContentAlign.top,
  //           builder: (context, controller) {
  //             return Container(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Lottie.asset('assets/newsjson.json',
  //                       height: 250, width: 250),
  //                   Text(
  //                     "Tap for News Section",
  //                     style: GoogleFonts.itim(
  //                         color: Colors.black, fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //   // targets.add(
  //   //   TargetFocus(
  //   //     identify: "DashboardDropdownkey",
  //   //     keyTarget: DashboardDropdownkey,
  //   //     alignSkip: Alignment.topRight,
  //   //     contents: [
  //   //       TargetContent(
  //   //         align: ContentAlign.top,
  //   //         builder: (context, controller) {
  //   //           return Container(
  //   //             child: Column(
  //   //               mainAxisSize: MainAxisSize.min,
  //   //               crossAxisAlignment: CrossAxisAlignment.center,
  //   //               mainAxisAlignment: MainAxisAlignment.center,
  //   //               children: <Widget>[
  //   //                 Lottie.asset('assets/dashboard.json',
  //   //                     height: 250, width: 250),
  //   //                 Text(
  //   //                   "Tap to switch Dashboard",
  //   //                   style: GoogleFonts.itim(
  //   //                       color: Colors.black, fontWeight: FontWeight.bold),
  //   //                 ),
  //   //               ],
  //   //             ),
  //   //           );
  //   //         },
  //   //       ),
  //   //     ],
  //   //   ),
  //   // );
  //   return targets;
  // }
}
