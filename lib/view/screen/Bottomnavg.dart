import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/ClassApp.dart';
import 'package:project/controller/Changetheme.dart';
import 'package:project/view/screen/Login.dart';
import 'package:project/view/screen/Singup.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({
    Key? key,
  }) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  List<Widget> A = [
    login(),
    Singup(),
  ];
  List appbar = ["45".tr, "46".tr];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    Changetheme controller = Get.put(Changetheme());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffc385c7),
          elevation: 0,
          title: Text(
            "${appbar[currentindex]}",
            style: ClassApp.appbar.headline2,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: A.elementAt(currentindex),
        bottomNavigationBar: Container(
          color:controller.isDark?Color(0XFF303030): Color.fromARGB(255, 246, 244, 250),
          child: SalomonBottomBar(
            selectedColorOpacity: 0.2,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  "Login",
                  style: TextStyle(fontFamily: "Cairo"),
                ),
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.person_add),
                title: Text(
                  "SingUp",
                  style: TextStyle(fontFamily: "CrimsonText"),
                ),
              ),
            ],
            currentIndex: currentindex,
            onTap: (i) => setState(() => currentindex = i),
            selectedItemColor: Color(0xffa53ff9),
            curve: Curves.decelerate,
            unselectedItemColor: Colors.black,
          ),
        ));
  }
}
