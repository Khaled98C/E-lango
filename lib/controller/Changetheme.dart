import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/Theme.dart';

import '../newservers/newserves.dart';




class Changetheme extends GetxController {
  MyServices myServices = Get.find();
  late bool isDark;

  getdark() {
    bool? dark = myServices.sharedPref.getBool("dark");
    if (dark == null) {
      dark = false;
      isDark = dark;
    } else {
      dark = myServices.sharedPref.getBool("dark");
      isDark = dark!;
    }
    update();
  }

  final primarycolorligth = const Color(0xffd8e0ed);
  final primarycolordark = const Color(0xff2e3243);
  ligthmode() {
    isDark = false;
    Get.changeTheme(ThemeEdite.light);
    myServices.sharedPref.remove("dark");
    update();
  }

  darkmode() {
    isDark = true;
    Get.changeTheme(ThemeEdite.dark);
    myServices.sharedPref.setBool("dark", isDark);
    update();
  }

  @override
  void onInit() {
    getdark();
    super.onInit();
  }
}
