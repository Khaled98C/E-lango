import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Static/StaticInternet/Statusrequest.dart';
import '../Static/StaticInternet/handlingdata.dart';
import '../newservers/newserves.dart';
import '../remot/ApiMapTrueorfalse.dart';
import '../view/screen/Bottomnavg.dart';
import '../view/screen/QuetsionPage.dart';

class ControllerMapquetsion extends GetxController {
  late RxInt total;
  MyServices myServices = Get.find();
  String? id_category;
  String? username;
  ApiMap api = ApiMap(Get.find());
  late StatusRequest statusRequest;
  List mapcatgory = [];

  check(String title) {
    Get.snackbar(" ", " ",
        forwardAnimationCurve: Curves.easeInOutExpo,
        margin: EdgeInsets.all(20),
        borderRadius: 20,
        backgroundColor: Colors.amber,
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(0, 236, 220, 237),
            Color(0xFFC385C7),
            //  Colors.white54
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadows: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(10, 10))
        ],
        duration: Duration(seconds: 3),
        messageText: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  checklevelgame(String index) {
    if (index == "1" && id_category == "1" && total >= 0) {
      Get.to(() => QuetsionPage(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "2" && id_category == "1" && (total >= 10)) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "3" && id_category == "1" && total >= 20) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "4" && id_category == "1" && total >= 30) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "5" && id_category == "1" && total >= 40) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "6" && id_category == "1" && total >= 50) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "7" && id_category == "1" && total >= 60) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "8" && id_category == "1" && total >= 70) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "9" && id_category == "1" && total >= 80) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "10" && id_category == "1" && total >= 90) {
      Get.to(() => QuetsionPage,
          arguments: {"id_level": index, "id_category": "1"});
    } else {
      check("33".tr);
    }
    return total;
  }

  int gettotal() {
    String totalscorestring =
        myServices.sharedPref.getString("totalscore") == null
            ? "0"
            : myServices.sharedPref.getString("totalscore")!;
    total = int.parse(totalscorestring).obs;

    return total.value;
  }

  GotoLevelGame(String index) async {
    // Get.to(() => Pagetrueorfalse(), arguments: {"id_level": index});
    if (index != "1" && (myServices.sharedPref.getString("name") == null)) {
      check("39".tr);

      await Future.delayed(Duration(seconds: 3));
      Get.to(() => Bottomnav());
    } else {
     // checklevelgame(index);
         Get.to(() => QuetsionPage(),
          arguments: {"id_level": index});
    }
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_category!);
    print("api in controller___MAP is ${response}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        mapcatgory.addAll(response['map']);
      } else {
        StatusRequest.Nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    id_category=Get.arguments["id_category"];
    getdata();

  }
}
