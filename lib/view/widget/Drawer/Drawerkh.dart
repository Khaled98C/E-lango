import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:project/Static/Colors.dart';
import 'package:project/view/screen/Homepage.dart';
import 'package:project/view/widget/Drawer/DrawerContent.dart';

class Drawerkh extends StatefulWidget {
  const Drawerkh({Key? key}) : super(key: key);

  @override
  _DrawerkhState createState() => _DrawerkhState();
}

class _DrawerkhState extends State<Drawerkh> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerContent(),
      mainScreen: Homepage(),
      androidCloseOnBackTap: true,
      boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colorss.primrycolor,
            offset: Offset.fromDirection(-8.5)),
      ],
      angle: -1.0,
      //closeDragSensitivity: 500,
      //closeCurve: Interval(0.3,0.9,curve:Curves.easeInCubic ),
      borderRadius: 70,
      showShadow: true,
      drawerShadowsBackgroundColor: Colorss.primrycolor,
      menuBackgroundColor: Colorss.secondcolor,
    );
  }
}
