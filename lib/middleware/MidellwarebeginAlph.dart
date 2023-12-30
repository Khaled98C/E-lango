import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../newservers/newserves.dart';


class BeginAlphaMidellware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString('skip2') != null)
      return RouteSettings(name: "/home");
    
  }
}
