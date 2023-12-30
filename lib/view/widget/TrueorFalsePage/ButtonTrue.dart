import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';

class ButtonTrue extends GetView<ControllerTrueOrFalseData> {
const ButtonTrue({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
      Timer? timer;

   

    return Container(
            height: 80,
            width: 400,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
               "37".tr,
                Color(0xFF8BC34A),
              ),
              onTapDown: (_) {
                controller.checkAnswerTrue("true");
              },
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 1),
                (_) => (_) {},
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          );
  }
}