import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Model/MultyChoiseModel.dart';
import '../../../controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';

class AudioPlayerDataModel extends GetView<ControllerAudioPlayerData> {
  AudioPlayerDataModel({Key? key,required this.model}) : super(key: key);
  ModelMultyChoise model;
  @override
  Widget build(BuildContext context) {
    Timer? timer;

    Widget row(String text, Color color) {
      return Padding(
        padding: EdgeInsets.all(12.5),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
        child: Column(
      children: [
        GetBuilder<ControllerAudioPlayerData>(
          builder: (controller) => Container(
            width: 420,
            height: 140,
            decoration: BoxDecoration(
                color: Color(0xffc385c7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GetBuilder<ControllerAudioPlayerData>(builder: (controller) {
                  return LinearPercentIndicator(
                    width: Get.width - 20,
                    lineHeight: 25,
                    percent: (controller.i / controller.data.length) > 1
                        ? (controller.i / controller.data.length)
                            .floor()
                            .toDouble()
                        : (controller.i / controller.data.length),
                    backgroundColor: Colors.grey,
                    progressColor: Color(0xFF8BC34A),
                    barRadius: Radius.circular(25),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${model.question}",
                    //  textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ترجمة النص",
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.translate,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.question,
                            autoHide: Duration(seconds: 5),
                            body: Container(
                              child: Column(
                                children: [
                                  Text(
                                      //data[que]['tr'],
                                      "${model.translation}",
                                      //  textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ))
                          ..show();
                        print(
                          controller.data[controller.quetionNumber]
                              ['translation'],
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //! image
        GetBuilder<ControllerAudioPlayerData>(
          builder: (controller) => Container(
            height: Get.height - 600,
            width: Get.width - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Lottie.asset(
                "Lelottie/${model.questionImage}"
                //data[que]['image'],
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<ControllerAudioPlayerData>(
              builder: (controller) => Container(
                height: 80,
                width: Get.width - 200,
                child: SpringButton(
                  SpringButtonType.OnlyScale,
                  GetBuilder<ControllerAudioPlayerData>(
                    builder: (controller) => row(
                      "${model.choice1}",
                      Color(0xFF8BC34A),
                    ),
                  ),
                  onTapDown: (_) {
                    controller.checkAnswerbutton1(
                        "${model.choice1}");
                  },
                  onLongPress: () => timer = Timer.periodic(
                    const Duration(milliseconds: 1),
                    (_) => (_) {},
                  ),
                  onLongPressEnd: (_) {
                    timer?.cancel();
                  },
                ),
              ),
            ),
            GetBuilder<ControllerAudioPlayerData>(
              builder: (controller2) => Container(
                height: 80,
                width: Get.width - 200,
                child: SpringButton(
                  SpringButtonType.OnlyScale,
                  GetBuilder<ControllerAudioPlayerData>(
                    builder: (controller) => row(
                      "${model.choice2}",
                      Colors.redAccent,
                    ),
                  ),
                  onTapDown: (_) {
                    controller.checkAnswerbutton2(
                        "${model.choice2}");
                  },
                  onLongPress: () => timer = Timer.periodic(
                    const Duration(milliseconds: 100),
                    (_) => (_) {},
                  ),
                  onLongPressEnd: (_) {
                    timer?.cancel();
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<ControllerAudioPlayerData>(
              builder: (controller2) => Container(
                height: 80,
                width: Get.width - 200,
                child: SpringButton(
                  SpringButtonType.OnlyScale,
                  GetBuilder<ControllerAudioPlayerData>(
                    builder: (controller) => row(
                      "${model.choice3}",
                      Color.fromARGB(255, 17, 38, 235).withOpacity(0.4),
                    ),
                  ),
                  onTapDown: (_) {
                    controller.checkAnswerbutton3(
                        "${model.choice3}");
                  },
                  onLongPress: () => timer = Timer.periodic(
                    const Duration(milliseconds: 1),
                    (_) => (_) {},
                  ),
                  onLongPressEnd: (_) {
                    timer?.cancel();
                  },
                ),
              ),
            ),
            GetBuilder<ControllerAudioPlayerData>(
              builder: (controller2) => Container(
                height: 80,
                width: Get.width - 200,
                child: SpringButton(
                  SpringButtonType.OnlyScale,
                  GetBuilder<ControllerAudioPlayerData>(
                    builder: (controller) => row(
                      "${model.choice4}",
                      Color.fromARGB(255, 228, 165, 56),
                    ),
                  ),
                  onTapDown: (_) {
                    controller.checkAnswerbutton4(
                        "${model.choice4}");
                  },
                  onLongPress: () => timer = Timer.periodic(
                    const Duration(milliseconds: 100),
                    (_) => (_) {},
                  ),
                  onLongPressEnd: (_) {
                    timer?.cancel();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    )

        // ClassDataTrueOrFalse(model: ModelTrueOrFalsedata.fromJson(controller.data[1]));

        );
  }
}
