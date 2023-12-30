import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';
import '../../../controller/ControllerTestQuetsion.dart';

class FisrtAndSecdondButton extends GetView<ControllerTestQuetsion> {
  const FisrtAndSecdondButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return Column(
      children: [
    GetBuilder<ControllerTestQuetsion>(
      builder: (controller) => Container(
        height: Get.height / 10,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          GetBuilder<ControllerTestQuetsion>(
            builder: (controller) => row(
              "${controller.data[controller.quetionNumber].chois1}",
              Color(0xFF8BC34A),
            ),
          ),
          onTapDown: (_) {
            controller.checkAnswerbutton1(
                "${controller.data[controller.quetionNumber].chois1}");
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
    GetBuilder<ControllerTestQuetsion>(
      builder: (controller2) => Container(
        height: Get.height / 10,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          GetBuilder<ControllerTestQuetsion>(
            builder: (controller) => row(
              "${controller2.data[controller2.quetionNumber].chois2}",
              Colors.redAccent,
            ),
          ),
          onTapDown: (_) {
            controller2.checkAnswerbutton2(
                "${controller2.data[controller2.quetionNumber].chois2}");
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
    );
  }
}
