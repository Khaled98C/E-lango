import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';
import '../../../controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';

class SecondRowButton extends GetView<ControllerAudioPlayerData> {
  const SecondRowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<ControllerAudioPlayerData>(
          builder: (controller2) => Expanded(
            child: Container(
              height: 80,
              width: Get.width - 200,
              child: SpringButton(
                SpringButtonType.OnlyScale,
                GetBuilder<ControllerAudioPlayerData>(
                  builder: (controller) => row(
                    "${controller2.data[controller2.quetionNumber]['choice3']}",
                    Color(0xffa53ff9),
                  ),
                ),
                onTapDown: (_) {
                  controller.checkAnswerbutton3(
                      "${controller2.data[controller2.quetionNumber]['choice3']}");
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
        ),
        GetBuilder<ControllerAudioPlayerData>(
          builder: (controller2) => Expanded(
            child: Container(
              height: 80,
              width: Get.width - 200,
              child: SpringButton(
                SpringButtonType.OnlyScale,
                GetBuilder<ControllerAudioPlayerData>(
                  builder: (controller) => row(
                    "${controller2.data[controller2.quetionNumber]['choice4']}",
                    Color.fromARGB(255, 228, 165, 56),
                  ),
                ),
                onTapDown: (_) {
                  controller.checkAnswerbutton4(
                      "${controller2.data[controller2.quetionNumber]['choice4']}");
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
        ),
      ],
    );
  }
}
