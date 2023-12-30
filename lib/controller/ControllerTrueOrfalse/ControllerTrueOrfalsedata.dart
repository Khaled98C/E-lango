import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/handlingdata.dart';
import 'package:project/remot/ApiTrueOrfalsedata.dart';
import 'package:confetti/confetti.dart';

import '../../newservers/newserves.dart';
import '../../view/screen/MapGameTrueFalse.dart';
import 'ControllermapPageTrueOrFalse.dart';

class ControllerTrueOrFalseData extends GetxController {
  MapPageTrueOrFalseController controller = Get.find();
  Future<void> onRefres() async {
    getdata();
    return await Future.delayed(Duration(milliseconds: 100));
  }

  late String id_category;
  final BuildContext context;
  ControllerTrueOrFalseData({required this.context});
  MyServices myServices = Get.find();
  ApiCTrueOrFalsedata api = ApiCTrueOrFalsedata(Get.find());
  int quetionNumber = 0;
  late StatusRequest statusRequest;
  double i = 0;
  late int total;
  late ConfettiController _controllerCenter;
  late List data = [];

  String? id_level;
  List<Widget> answersol = [];
  //? التحقق من ان ليست الاسئلة خلصت او لا
  isfinish() {
    if (quetionNumber >= data.length) {
      return true;
    } else {
      return false;
    }
  }

//   NumberFormat numberFormat = NumberFormat.decimalPattern([locale: 'en_US']);
// String formattedNumber = numberFormat.format(double.parse(numberInEnglish));

  ///* تصفير عداد الاسئلة
  void reset() {
    quetionNumber = 0;
    i = 0;
    data.shuffle();
    update();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_level.toString());
    print("api in controller_level_data is ${response}");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      update();
      if (response['status'] == "success") {
        data.addAll(response['level']);
        data.shuffle();
      } else {
        StatusRequest.Nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    id_level = Get.arguments['id_level'];
    id_category = Get.arguments['id_category'];
    getdata();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    // gettotal();
    Get.closeAllSnackbars();
    total = controller.total.value;

    print("------------------------------------------ ");
    print("inital  total =$total ");

    print("------------------------------------------\n");
    super.onInit();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  checkAnswerTrue(String whatuserselect) {
    String coorectanser = data[quetionNumber]['solution'];

    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      i++;

      print(quetionNumber);
      print(coorectanser);
    } else {
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        dialogType: DialogType.error,
        context: context,
        animType: AnimType.topSlide,
        title: "ops",
        desc: "54".tr,
        btnOkOnPress: () {},
        btnOkColor: Colors.red,
      )..show();
    }

    update();
    if (isfinish() == true) {
      int print1 = calcsul();
      controller.total.value = calcsul();
      print("totalscore is :${controller.total}");

      _controllerCenter.play();
      AwesomeDialog(
        dialogType: DialogType.success,
        context: context,
        animType: AnimType.topSlide,
        body: ConfettiWidget(
          child: Container(
            height: 200,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  "52".tr,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                )),
                Expanded(
                    child: Lottie.asset("Lelottie/winner.json", repeat: false),
                    flex: 3),
              ],
            ),
          ),
          confettiController: _controllerCenter,
          shouldLoop: true, // start again as soon as the animation is finished
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ],
          createParticlePath: drawStar,
          blastDirectionality: BlastDirectionality.explosive,
        ),
        title: "52".tr,
        desc: '52'.tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
      reset();
    }

    update();
  }

  int calcsul() {
    if (id_level == "1" &&
        id_category == "1" &&
        // ignore: unnecessary_null_comparison
        (total >= 10)) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "2" && id_category == "1" && (total >= 20)) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "3" && id_category == "1" && total >= 30) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "4" && id_category == "1" && total >= 40) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "5" && id_category == "1" && total >= 50) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "6" && total >= 60) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "7" && id_category == "1" && total >= 70) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "8" && id_category == "1" && total >= 80) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "9" && id_category == "1" && total >= 90) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "10" && id_category == "1" && total >= 100) {
      myServices.sharedPref.getString("totalscore");
    } else {
      myServices.sharedPref.setString(
          "totalscore", "${(total = total + 10).toInt().toString()}");
    }

    return total;
  }

////////////!
  checkAnswerFalse(String whatuserselect) {
    String coorectanser = data[quetionNumber]['solution'];

    if (coorectanser == whatuserselect) {
      i++;

      quetionNumber++;
      print(quetionNumber);
      print(coorectanser);
    } else {
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        dialogType: DialogType.error,
        context: context,
        animType: AnimType.topSlide,
        title: "ops",
        desc: "54".tr,
      )..show();
    }
    update();
    if (isfinish() == true) {
      int print1 = calcsul();
      controller.total.value = calcsul();
      print("totalscore is :${controller.total}");

      update();

      _controllerCenter.play();
      AwesomeDialog(
        body: ConfettiWidget(
          child: Container(
            height: 200,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  "52".tr,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                )),
                Expanded(
                    flex: 3,
                    child: Lottie.asset("Lelottie/winner.json", repeat: false)),
              ],
            ),
          ),
          confettiController: _controllerCenter,
          shouldLoop: true, // start again as soon as the animation is finished
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ],
          createParticlePath: drawStar,
          blastDirectionality: BlastDirectionality.explosive,
        ),
        dialogType: DialogType.success,
        context: context,
        animType: AnimType.topSlide,
        title: "52".tr,
        desc: '52'.tr,
        btnOkOnPress: () {
          _controllerCenter.play();

          Get.back();
        },
      )..show();
      reset();
    }
    update();
  }
}
