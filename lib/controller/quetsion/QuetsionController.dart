import 'dart:math';
import 'package:project/Static/Colors.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Static/StaticInternet/Statusrequest.dart';
import '../../Static/StaticInternet/handlingdata.dart';
import '../../remot/ApiQuestion.dart';

class QuetsionController extends GetxController {
  final BuildContext context;
  
  String? id_level;
  late StatusRequest statusRequest;
  ApiQuestion22 api = ApiQuestion22(Get.find());
  QuetsionController({required this.context});
  late GlobalKey<FormState> formstate;
  late ConfettiController _controllerCenter;
  List data =[
    {
      "id": 151,
      "question": "red",
      "solution": "احمر"
    },
    {
      "id": 152,
      "question": "green",
      "solution": "اخضر"
    },
    {
      "id": 153,
      "question": "white",
      "solution": "ابيض"
    },
    {
      "id": 154,
      "question": "blue",
      "solution": "ازرق"
    },
    {
      "id": 155,
      "question": "yellow",
      "solution": "اصفر"
    }
  ];
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_level.toString());
    print(response);
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

  late TextEditingController usersol;

  int quetionNumber = 0;
  double i = 0;
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

  bool isfinish() {
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

  checkAnswer(String whatuserselect) {
    String coorectanser = data[quetionNumber]['solution'];
    //* // final bool similar = areWordsSimilar(whatuserselect, coorectanser);
    // print(similar);

    getRange() {
      double similarity = whatuserselect.similarityTo(coorectanser);
      return similarity;
    }

    double rate = getRange();
    print("the rite is :$rate");
    double hegth = Get.height - 650;
    if (rate >= 0.6&&rate!=1) {
    
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
        messageText: 
        Text(
                  " اجابتك غير دقيقة \n  الاجابة الصحيحة هي:${data[quetionNumber]['solution']}")
      );
  

      
    }
    if (coorectanser.trim() == whatuserselect.trim() || rate >= 0.6) {
      quetionNumber++;

      i++;
      print("YOU ARE GOOD");
      print(quetionNumber);
      usersol.clear();
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
        desc: "52".tr,
        btnOkOnPress: () {
          reset();

          Get.back();
        },
      )..show();
    }

    update();
  }

  @override
  void onInit() {
    //getdata();
    id_level = Get.arguments['id_level'];
    usersol = TextEditingController();
    formstate = GlobalKey<FormState>();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.onInit();
  }
}
