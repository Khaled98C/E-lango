import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/Static/ClassApp.dart';

import 'package:project/Static/Colors.dart';

import 'package:spring_button/spring_button.dart';

import '../../Static/row.dart';
import '../../controller/ControllerAuth/ControllerProfile.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    ControllerProfile controller = Get.put(ControllerProfile());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffc385c7),
          elevation: 0,
          title: Text(
            "27".tr,
            style: ClassApp.appbar.headline2,
          )),
      body: Column(
        children: [
          Container(
            height: 267,
            child: Stack(
              children: [
                Positioned(
                  width: Get.width + 30,
                  height: 300,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/two.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 145,
                  child: CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: Color(0xffa53ff9).withOpacity(0.7),
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      child: ClipRRect(
                          child: Image.asset(
                            controller.gender == "Female"
                                ? "images/girlprofile.png"
                                : "images/child.jpg",
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  ),
                ), //                 Row(
                Center(
                  child: Text(
                    "${controller.username}",
                    style: ClassApp.txt_style.headline1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                child: Card(
                    margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colorss.primrycolor.withOpacity(0.2)),
                        width: 330.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.date_range_rounded,
                                  size: 35,
                                  color: Color.fromARGB(255, 172, 158, 14),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("28".tr,
                                        style:
                                            ClassApp.profileditels.headline3),
                                    Text(
                                        "${(controller.birthday.substring(0, 10))}",
                                        style:
                                            ClassApp.profileditels.headline3),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.pinkAccent[400],
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("29".tr,
                                        style:
                                            ClassApp.profileditels.headline3),
                                    Text("${(controller.email)}",
                                        style:
                                            ClassApp.profileditels.headline3),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               
                                Icon(
                                  Icons.person,
                                  color: Colorss.secondcolor,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("30".tr,
                                        style:
                                            ClassApp.profileditels.headline3),
                                    Text("${(controller.gender)}",
                                        style: ClassApp.profileditels.headline3)
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.onetwothree_sharp,
                                  color: Colors.black,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("31".tr,
                                        style:
                                            ClassApp.profileditels.headline3),
                                    Text(
                                      "${controller.r}",
                                      style: ClassApp.profileditels.headline3,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )))),
          ),
          Container(
            height: 80,
            width: 400,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
"32".tr,                Color(0xffa53ff9),
              ),
              onTapDown: (_) {
                controller.Singout();
              },
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 1),
                (_) => (_) {},
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
        ],
      ),
    );
  }
}
