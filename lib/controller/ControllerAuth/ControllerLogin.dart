import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/remot/ApiLogin.dart';

import 'package:project/view/widget/Drawer/Drawerkh.dart';

import '../../Static/StaticInternet/handlingdata.dart';
import '../../newservers/newserves.dart';

class ControllerLogin extends GetxController {
  Apilogin api = Apilogin(Get.find());
  late GlobalKey<FormState> formstate;
  late StatusRequest statusRequest;
  late TextEditingController username;
  late TextEditingController password;
  bool pass = true;
  MyServices myServices = Get.find();
  hidepass() {
    if (pass == true) {
      pass = false;
    } else {
      pass = true;
    }

    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    getdatalogin();
    super.onInit();
  }

  getdatalogin() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await api.getdata(username.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        myServices.sharedPref.remove("totalscore");
        if (response['status'] == "success") {
          myServices.sharedPref
              .setString("id", response['user']['id'].toString());

          myServices.sharedPref
              .setString("birth_date", response['user']['birth_date']);
          myServices.sharedPref.setString("name", response['user']['name']);
          myServices.sharedPref.setString("email", response['user']['email']);
          myServices.sharedPref.setString("gender", response['user']['gender']);
          myServices.sharedPref.setString("totalscore", "140");
          
          successlogin();
          await Future.delayed(Duration(seconds: 3));
          Get.offAll(() => Drawerkh());
        } else if (response['status'] == "failuer") {
          faildlogin();
        }
      }
    }
  }

  faildlogin() {
    Get.snackbar(" ", " ",
        forwardAnimationCurve: Curves.easeInOutExpo,
        margin: EdgeInsets.all(20),
        borderRadius: 20,
        backgroundColor: Colors.amber,
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(0, 236, 220, 237),
            Color(0xFFC385C7),
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
        icon: Lottie.asset("lot/false.json"),
        duration: Duration(seconds: 5),
        messageText: Text(
       "51".tr,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  successlogin() {
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
        icon: Lottie.asset("lot/t.json"),
        duration: Duration(seconds: 3),
        messageText: Text(
          "50".tr,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
}
