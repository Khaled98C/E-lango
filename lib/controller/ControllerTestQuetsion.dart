// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/newservers/newserves.dart';
import 'package:project/view/widget/Drawer/Drawerkh.dart';

class ControllerTestQuetsion extends GetxController {
  BuildContext context;
  ControllerTestQuetsion({required this.context});
  double i = 0;
  int numbersultrue = 0;
  late ConfettiController _controllerCenter;
  List<TestQuetsion> data = [
    TestQuetsion(
      chois1: "one",
      chois2: "two",
      chois3: "three",
      chois4: "zero",
      name: "0.gif",
      sul: "zero",
    ),
    TestQuetsion(
      name: "2.gif",
      sul: "two",
      chois1: "one",
      chois2: "three",
      chois3: "two",
      chois4: "six",
    ),
    TestQuetsion(
      name: "3.gif",
      sul: "three",
      chois1: "seven",
      chois2: "three",
      chois3: "four",
      chois4: "one",
    ),
    TestQuetsion(
      name: "5.gif",
      sul: "five",
      chois1: "seven",
      chois2: "three",
      chois3: "five",
      chois4: "nine",
    ),
    TestQuetsion(
      name: "9.gif",
      sul: "nine",
      chois1: "ten",
      chois2: "three",
      chois3: "five",
      chois4: "nine",
    )
    ////// * alpha
    ,
    TestQuetsion(
      name: "a.gif",
      sul: "A",
      chois1: "E",
      chois2: "F",
      chois3: "C",
      chois4: "A",
    ),
    TestQuetsion(
      name: "b.gif",
      sul: "B",
      chois1: "A",
      chois2: "B",
      chois3: "C",
      chois4: "F",
    ),
    TestQuetsion(
      name: "c.gif",
      sul: "C",
      chois1: "A",
      chois2: "B",
      chois3: "Z",
      chois4: "C",
    ),
    TestQuetsion(
      name: "d.gif",
      sul: "D",
      chois1: "D",
      chois2: "B",
      chois3: "Z",
      chois4: "C",
    ),
    TestQuetsion(
      name: "z.gif",
      sul: "Z",
      chois1: "Z",
      chois2: "B",
      chois3: "G",
      chois4: "C",
    )

    ///* animal
    ,
    /*
    TestQuetsion(
      name: "tiger.json",
      sul: "Tiger",
      chois1: "Zebra",
      chois2: "Tiger",
      chois3: "Camel",
      chois4: "Cat",
    ),
    TestQuetsion(
      name: "wolf.json",
      sul: "Wolf",
      chois1: "Dog",
      chois2: "Bird",
      chois3: "Cat",
      chois4: "Wolf",
    ),
    TestQuetsion(
      name: "panda.json",
      sul: "Panda",
      chois1: "Panda",
      chois2: "Whale",
      chois3: "Camel",
      chois4: "Snack",
    ),
    TestQuetsion(
      name: "dog.json",
      sul: "Dog",
      chois1: "Bat",
      chois2: "Dog",
      chois3: "Bee",
      chois4: "Butterfly",
    ),
    TestQuetsion(
      name: "cat.json",
      sul: "Cat",
      chois1: "Cat",
      chois2: "Whale",
      chois3: "Cow",
      chois4: "Crab",
    )*/
  ];
  MyServices myServices = Get.find();
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

  int quetionNumber = 0;
  checkAnswerbutton1(String whatuserselect) {
    String coorectanser = data[quetionNumber].sul;
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      numbersultrue++;
      i++;
      print("true $numbersultrue");
    } else {
      i++;
      quetionNumber++;
    }
    if (isfinish() == true) {
      myServices.sharedPref.setString("testresult",numbersultrue.toString());
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
                    " You answered ${numbersultrue}  of the questions",
                  style: TextStyle(
                    fontSize: 20,
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
        btnCancel: InkWell(
            onTap: () {
              reset();
              Get.back();
            },
            child: Text("Reset")),
        btnOk: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: () {
              Get.to(() => Drawerkh());
            },
            child: Container(
              color: Colors.green,
              child: Text("GoHome"),
              alignment: Alignment.center,
            )),
      )..show();
      reset();
    }
    print("qutseion number is:$quetionNumber");

    update();
  }

  checkAnswerbutton2(String whatuserselect) {
    String coorectanser = data[quetionNumber].sul;
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      numbersultrue++;
      i++;
      print("true $numbersultrue");
    } else {
      i++;
      quetionNumber++;
    }
    if (isfinish() == true) {
      myServices.sharedPref.setString("testresult",numbersultrue.toString());
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
                    " You answered ${numbersultrue}  of the questions",
                  style: TextStyle(
                    fontSize: 20,
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
        btnCancel: InkWell(
            onTap: () {
              reset();
              Get.back();
            },
            child: Text("Reset")),
        btnOk: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: () {
              Get.to(() => Drawerkh());
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.green,
              child: Text("Go to home"),
              alignment: Alignment.center,
            )),
      )..show();
      reset();
    }
    print("qutseion number is:$quetionNumber");
    update();
  }

  checkAnswerbutton4(String whatuserselect) {
    String coorectanser = data[quetionNumber].sul;
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      numbersultrue++;
      i++;
      print("true $numbersultrue");
    } else {
      i++;
      quetionNumber++;
    }
    if (isfinish() == true) {
      myServices.sharedPref.setString("testresult",numbersultrue.toString());
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
                     " You answered ${numbersultrue}  of the questions",
                  style: TextStyle(
                    fontSize: 20,
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
        btnCancel: InkWell(
            onTap: () {
              reset();
              Get.back();
            },
            child: Text("Reset")),
        btnOk: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: () {
              Get.to(() => Drawerkh());
            },
            child: Container(
              color: Colors.green,
              child: Text("GoHome"),
              alignment: Alignment.center,
            )),
      )..show();
      reset();
    }
    print("qutseion number is:$quetionNumber");
    update();
  }

  checkAnswerbutton3(String whatuserselect) {
    String coorectanser = data[quetionNumber].sul;
    if (coorectanser.trim() == whatuserselect) {
      quetionNumber++;
      numbersultrue++;
      print("true $numbersultrue");
      i++;
    } else {
      i++;
      quetionNumber++;
    }
    if (isfinish() == true) {
      myServices.sharedPref.setString("testresult",numbersultrue.toString());
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
                //  ' لقد اجبت عن  ${numbersultrue}  اسئلة ',
                " You answered ${numbersultrue}  of the questions",
                  style: TextStyle(
                    fontSize: 20,
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
        btnCancel: InkWell(
            onTap: () {
              reset();
              Get.back();
            },
            child: Text("Reset")),
        btnOk: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: () {
              Get.to(() => Drawerkh());
            },
            child: Container(
              color: Colors.green,
              child: Text("GoHome"),
              alignment: Alignment.center,
            )),
      )..show();
      reset();
    }

    print("qutseion number is:$quetionNumber");
    update();
  }

  bool isfinish() {
    if (quetionNumber >= data.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    quetionNumber = 0;
    i = 0;
    numbersultrue = 0;
    data.shuffle();
    update();
  }

  @override
  void onInit() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.onInit();
  }
}

class TestQuetsion {
  String name;
  String chois1;
  String chois2;
  String chois3;
  String chois4;
  String sul;
  TestQuetsion({
    required this.chois1,
    required this.chois2,
    required this.chois3,
    required this.chois4,
    required this.name,
    required this.sul,
  });
}
