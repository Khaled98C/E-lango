import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../newservers/newserves.dart';





class OnpordMidelware extends GetMiddleware {
  MyServices myServices= Get.find();
@override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString('skip') != null)
      return RouteSettings(name: "/home");
        
 
  } 
  


}