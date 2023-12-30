import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project/controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';

class FirstRowButton extends GetView<ControllerAudioPlayerData> {
  const FirstRowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<ControllerAudioPlayerData>(
          builder: (controller) => Expanded(
            child: Container(
              height: 80,
              width: Get.width - 200,
              child: SpringButton(
                SpringButtonType.OnlyScale,
                GetBuilder<ControllerAudioPlayerData>(
                  builder: (controller) => row(
                    "${controller.data[controller.quetionNumber]['choice1']}",
                    Color(0xFF8BC34A),
                  ),
                ),
                onTapDown: (_) {
                  controller.checkAnswerbutton1(
                      "${controller.data[controller.quetionNumber]['choice1']}");
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
                    "${controller2.data[controller2.quetionNumber]['choice2']}",
                    Colors.redAccent,
                  ),
                ),
                onTapDown: (_) {
                  controller.checkAnswerbutton2(
                      "${controller2.data[controller2.quetionNumber]['choice2']}");
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
