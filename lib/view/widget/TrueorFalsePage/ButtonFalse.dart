import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';
import 'package:spring_button/spring_button.dart';
import '../../../Static/row.dart';

class ButtonFalse extends GetView<ControllerTrueOrFalseData> {
  const ButtonFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    return Container(
      height: 80,
      width: 400,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "38".tr,
          Colors.redAccent,
        ),
        onTapDown: (_) {
          controller.checkAnswerFalse("false");
        },
        onLongPress: () => timer = Timer.periodic(
          const Duration(milliseconds: 100),
          (_) => (_) {},
        ),
        onLongPressEnd: (_) {
          timer?.cancel();
        },
      ),
    );
  }
}
