import 'package:flutter/material.dart';
import 'package:integraphics/Screens/DropdownScreens/Cardwidget.dart';

import '../Screens/DropdownScreens/APC_Rehan.dart';

List<Widget> containers = [
  Apc_Rehan_Widget(),
  CI_Tree(),
  CRM_widget(),
  CRM_TREE_NEW(),
];

//todo : CRM WIDGET
class CRM_widget extends StatefulWidget {
  const CRM_widget({super.key});

  @override
  State<CRM_widget> createState() => _CRM_widgetState();
}

class _CRM_widgetState extends State<CRM_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}

//Todo: CI TREE WIDGET
class CI_Tree extends StatefulWidget {
  const CI_Tree({super.key});

  @override
  State<CI_Tree> createState() => _CI_TreeState();
}

class _CI_TreeState extends State<CI_Tree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

//todo: CRM_TREE_NEW WIDGET
class CRM_TREE_NEW extends StatefulWidget {
  const CRM_TREE_NEW({super.key});

  @override
  State<CRM_TREE_NEW> createState() => _CRM_TREE_NEWState();
}

class _CRM_TREE_NEWState extends State<CRM_TREE_NEW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: []),
      color: Colors.greenAccent,
    );
  }
}
