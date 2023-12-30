import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';
import '../../../controller/ControllerTestQuetsion.dart';

class ThreeFourbottun extends GetView<ControllerTestQuetsion> {
  const ThreeFourbottun({Key? key}) : super(key: key);

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
                  "${controller.data[controller.quetionNumber].chois3}",
                  Color(0xffa53ff9),
                ),
              ),
              onTapDown: (_) {
                controller.checkAnswerbutton3(
                    "${controller.data[controller.quetionNumber].chois3}");
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
                  "${controller2.data[controller2.quetionNumber].chois4}",
                  Color.fromARGB(255, 228, 165, 56),
                ),
              ),
              onTapDown: (_) {
                controller2.checkAnswerbutton4(
                    "${controller2.data[controller2.quetionNumber].chois4}");
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
