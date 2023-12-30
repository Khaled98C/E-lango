

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:project/remot/ApiSingup.dart';


import '../../Static/StaticInternet/Statusrequest.dart';
import '../../Static/StaticInternet/handlingdata.dart';
import '../../newservers/newserves.dart';
import '../../view/widget/Drawer/Drawerkh.dart';

class ControllerSingup extends GetxController {
  ControllerSingup({required this.context});
  late BuildContext context;
  checktime() async {
    dateTime = (await showDatePicker(
        initialDatePickerMode: DatePickerMode.year,
        confirmText: "Save",
        cancelText: "Cancel",
        builder: (context, child) => Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xff6a448d), // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Color(0xff6a448d), // button text color
                  ),
                ),
              ),
              child: child!,
            ),
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100)))!;

    print(dateTime);
    update();
  }

  late DateTime dateTime;
  bool pass = true;

  var selectedValue = 'Male';
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  ApiSingup api = ApiSingup(Get.find());
  MyServices myServices = Get.find();
  late GlobalKey<FormState> formstate;
  late StatusRequest statusRequest;
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController birthday;
  getdatasingup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await api.getdataSingup(username.text, password.text,
          selectedValue, dateTime.toString(), email.text);
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
          myServices.sharedPref
              .setString("totalscore", response['user']['score'].toString());

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
          "هذا الحساب موجود مسبقا",
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
          "تم انشاء الحساب بنجاح ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  @override
  void onInit() {
    dateTime = DateTime.now();

    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    birthday = TextEditingController();
    formstate = GlobalKey<FormState>();
    getdatasingup();
    super.onInit();
  }

  hidepass() {
    if (pass == true) {
      pass = false;
    } else {
      pass = true;
    }
    update();
  }
}
