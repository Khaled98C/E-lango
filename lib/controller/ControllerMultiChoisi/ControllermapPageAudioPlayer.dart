import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/handlingdata.dart';
import 'package:project/view/screen/Bottomnavg.dart';
import 'package:project/view/screen/PageAudioPlayer.dart';

import '../../newservers/newserves.dart';
import '../../remot/ApiMapAudioPlayer.dart';

class ControllermapofLevelAudioPlayer extends GetxController {
  Future<void> onRefres() async {
    getdata(id_category!);
    return await Future.delayed(Duration(milliseconds: 100));
  }

  MyServices myServices = Get.find();
  late RxInt total;
  String? id_category;
  ApiMapAudio api = ApiMapAudio(Get.find());
  late StatusRequest statusRequest;
  GotoLevelGame(String index) async {
    if (index != "11" && (myServices.sharedPref.getString("name") == null)) {
      //  && (myServices.sharedPref.getString("name") == null)
      //checklevelgame(index);
      check("39".tr);
      await Future.delayed(Duration(seconds: 3));
      Get.to(() => Bottomnav());
    } else {
      checklevelgame(index);
      // Get.to(() => PageAudioPlayer(),
      //     arguments: {"id_level": index, "id_category": "2"});
    }
  }

  Future checklevelgame(String index) async {
    if (index == "11" && id_category == "2" && total >= 100) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "12" && id_category == "2" && (total >= 110)) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "13" && id_category == "2" && total >= 120) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "14" && id_category == "2" && total >= 130) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "15" && id_category == "2" && total >= 140) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "16" && id_category == "2" && total >= 150) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "17" && id_category == "2" && total >= 160) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "18" && id_category == "2" && total >= 170) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "19" && id_category == "2" && total >= 180) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else if (index == "20" && id_category == "2" && total >= 190) {
      Get.to(() => PageAudioPlayer(),
          arguments: {"id_level": index, "id_category": "2"});
    } else {
      check("33".tr);
    }
    return total;
  }

  List mapcatgory = [];
  ApiMapAudio mapaudio = ApiMapAudio(Get.find());
  getdata(String id_category) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await api.getdata(id_category);
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
    id_category = Get.arguments['id_category'];
    getdata(id_category!);
    gettotal();
    super.onInit();
  }

  int gettotal() {
    String totalscorestring =
        myServices.sharedPref.getString("totalscore") == null
            ? "0"
            : myServices.sharedPref.getString("totalscore")!;
    total = int.parse(totalscorestring).obs;
    return total.value;
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
        animationDuration: Duration(seconds: 1),
        reverseAnimationCurve: Curves.easeInOutExpo,
        messageText: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
}
