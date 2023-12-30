import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/Static/ClassApp.dart';
import 'package:project/controller/Controllerhome.dart';

import '../../../newservers/newserves.dart';

class HelloDear extends GetView<Controllerhome> {
  const HelloDear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myservies = Get.find();
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 50,
            backgroundColor: Color(0xffa53ff9).withOpacity(0.7),
            child: Container(
              height: Get.height,
              width: Get.width,
              child: ClipRRect(
                  child: Image.asset(
                    myservies.sharedPref.getString("gender") != null &&
                            myservies.sharedPref.getString("gender") == "Female"
                        ? "images/girlprofile.png"
                        : "images/child.jpg",
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          Text(
              myservies.sharedPref.getString("gender") != null &&
                      myservies.sharedPref.getString("gender") == "Female"
                  ? "6".tr
                  : "7".tr,
              style: ClassApp.txt_style.headline1),
          Text(
              myservies.sharedPref.getString("name") == null
                  ? " "
                  : myservies.sharedPref.getString("name").toString(),
              style: ClassApp.txt_style.headline1),
        ],
      ),
    );
  }
}
