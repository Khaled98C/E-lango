// ignore_for_file: deprecated_member_use, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/handlingdata.dart';
import 'package:project/remot/ApiMapTrueorfalse.dart';
import 'package:project/view/screen/Bottomnavg.dart';
import 'package:project/view/screen/pagetrueorfalse.dart';

import '../../newservers/newserves.dart';

//! هذا كونترولر خريطة صح او خطا
class MapPageTrueOrFalseController extends GetxController {
  late RxInt total;
  //* i عدد الاسئلة الصحيحة
  MyServices myServices = Get.find();
  String? id_category;
  String? username;
  Future<void> onRefres() async {
    getdata();
    return await Future.delayed(Duration(milliseconds: 100));
  }

  ApiMap api = ApiMap(Get.find());
  late StatusRequest statusRequest;
  List mapcatgory = [];
  GotoLevelGame(String index) async {
    // Get.to(() => Pagetrueorfalse(), arguments: {"id_level": index});
    if (index != "1" && (myServices.sharedPref.getString("name") == null)) {
      check("39".tr);

      await Future.delayed(Duration(seconds: 3));
      Get.to(() => Bottomnav());
    } else {
      checklevelgame(index);
      // Get.to(() => Pagetrueorfalse(), arguments: {"id_level": index,'id_category':'1'});
    }
  }

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

  @override
  void onInit() {
    gettotal();
    id_category = Get.arguments['id_category'];
    getdata();

    super.onInit();
  }

  checklevelgame(String index) {
    if (index == "1" && id_category == "1" && total >= 0) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "2" && id_category == "1" && (total >= 10)) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "3" && id_category == "1" && total >= 20) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "4" && id_category == "1" && total >= 30) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "5" && id_category == "1" && total >= 40) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "6" && id_category == "1" && total >= 50) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "7" && id_category == "1" && total >= 60) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "8" && id_category == "1" && total >= 70) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "9" && id_category == "1" && total >= 80) {
      Get.to(() => Pagetrueorfalse(),
          arguments: {"id_level": index, "id_category": "1"});
    } else if (index == "10" && id_category == "1" && total >= 90) {
      Get.to(() => Pagetrueorfalse(),
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
}
