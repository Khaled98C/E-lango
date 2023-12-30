import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/remot/ApiAudioPlayerdata.dart';

import '../../Static/StaticInternet/handlingdata.dart';
import '../../newservers/newserves.dart';
import 'ControllermapPageAudioPlayer.dart';

class ControllerAudioPlayerData extends GetxController {
  ControllermapofLevelAudioPlayer controller = Get.find(); Future<void> onRefres() async {
    getdata(id_category);
    return await Future.delayed(Duration(milliseconds: 100));
  }
  late String id_category;
  ApiCAudioPlayerdata api = ApiCAudioPlayerdata(Get.find());
  final BuildContext context;
   late int total;
  ControllerAudioPlayerData({
    required this.context,
  });
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  late ConfettiController _controllerCenter;
  List data = [];
  String? id_level;
  int quetionNumber = 0;
  double i = 0;
  //? التحقق من ان ليست الاسئلة خلصت او لا
  isfinish() {
    if (quetionNumber >= data.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    quetionNumber = 0;
    i = 0;
    data.shuffle();
    update();
  }

  int calcsul() {
    if (id_level == "11" && id_category == "2" && total >= 110) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "12" && id_category == "2" && (total >= 120)) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "13" && id_category == "2" && total >= 130) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "14" && id_category == "2" && total >= 140) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "15" && id_category == "2" && total >= 150) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "16" && id_category == "2" && total >= 160) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "17" && id_category == "2" && total >= 170) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "18" && id_category == "2" && total >= 180) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "19" && id_category == "2" && total >= 190) {
      myServices.sharedPref.getString("totalscore");
    } else if (id_level == "20" && id_category == "2" && total >= 200) {
      myServices.sharedPref.getString("totalscore");
    } else {
      myServices.sharedPref.setString(
          "totalscore", "${(total = total + 10).toInt().toString()}");
    }
    return total;
  }

  getdata(String id_level) async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_level);
    print("api in controller_levelAudio_data is ${response}");
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

  upscore(int up) {
    myServices.sharedPref.setString("totalscore", up.toString());
  }

  @override
  void onInit() {
    id_level = Get.arguments['id_level'];
    id_category = Get.arguments['id_category'];
    getdata(id_level!);
   
  total = controller.total.value;
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    Get.closeAllSnackbars();
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

  checkAnswerbutton1(String whatuserselect) {
    
    String coorectanser = data[quetionNumber]['solution'];
  
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      i++;
      update();
      print(quetionNumber);
      print(coorectanser);

      
    } else {
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        dialogType: DialogType.error,
        context: context,
        animType: AnimType.topSlide,
        title: "ops",
        desc:"54".tr,
        btnOkOnPress: () {},
        btnOkColor: Colors.red,
      )..show();
    }

    update();
    if (isfinish() == true) {
      controller.total.value = calcsul();
     print("totalscore is :${controller.total}");
     
      reset();
      update();
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
                    fontSize:15,
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
        desc: "52".tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
    }

    update();
  }

  ///!
  checkAnswerbutton2(String whatuserselect) {
    //late String coorectanser;
    // coorectanser.compareTo(data[quetionNumber]['solution']);
    String coorectanser = data[quetionNumber]['solution'];
    // print("backend${coorectanser = data[quetionNumber]['solution']}");
    // print("user select is ${whatuserselect}");
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      i++;
      update();
      print(quetionNumber);
      print(coorectanser);
      // total = myServices.sharedPref.setString("totalscore", '${(i).toString()}')
      //     as String;
    } else {
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        dialogType: DialogType.error,
        context: context,
        animType: AnimType.topSlide,
        title: "ops",
        desc: "54".tr
        ,
        btnOkOnPress: () {},
        btnOkColor: Colors.red,
      )..show();
    }

    update();
    if (isfinish() == true) {
      controller.total.value = calcsul();
     print("totalscore is :${controller.total}");
      reset();
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
        dialogType: DialogType.success,
        context: context,
        animType: AnimType.topSlide,
        title:"52".tr,
        desc: '52'.tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
    }

    update();
  }

  //!
  checkAnswerbutton3(String whatuserselect) {
    //late String coorectanser;
    // coorectanser.compareTo(data[quetionNumber]['solution']);
    String coorectanser = data[quetionNumber]['solution'];
    // print("backend${coorectanser = data[quetionNumber]['solution']}");
    // print("user select is ${whatuserselect}");
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      i++;
      update();
      print(quetionNumber);
      print(coorectanser);
      // total = myServices.sharedPref.setString("totalscore", '${(i).toString()}')
      //     as String;
    } else {
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        dialogType: DialogType.error,
        context: context,
        animType: AnimType.topSlide,
        title: "ops",
        desc: '54'.tr,
        btnOkOnPress: () {},
        btnOkColor: Colors.red,
      )..show();
    }

    update();
    if (isfinish() == true) {
      controller.total.value = calcsul();
     print("totalscore is :${controller.total}");
      reset();
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
        dialogType: DialogType.success,
        context: context,
        animType: AnimType.topSlide,
        title: "52".tr,
        desc: "52".tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
    }

    update();
  }

  ///!
  checkAnswerbutton4(String whatuserselect) {
    //late String coorectanser;
    // coorectanser.compareTo(data[quetionNumber]['solution']);
    String coorectanser = data[quetionNumber]['solution'];
    // print("backend${coorectanser = data[quetionNumber]['solution']}");
    // print("user select is ${whatuserselect}");
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      i++;
      update();
      print(quetionNumber);
      print(coorectanser);
      // total = myServices.sharedPref.setString("totalscore", '${(i).toString()}')
      //     as String;
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
       controller.total.value = calcsul();
     print("totalscore is :${controller.total}");
      reset();
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
        dialogType: DialogType.success,
        context: context,
        animType: AnimType.topSlide,
        title: "52".tr,
        desc: "52".tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
    }

    update();
  }
}
