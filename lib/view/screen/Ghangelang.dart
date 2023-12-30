import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/Colors.dart';
import 'package:project/Static/StaticTranslion/ControllerTranslion.dart';
import 'package:spring_button/spring_button.dart';

import '../../Static/row.dart';

class Ghangelang extends StatelessWidget {
  const Ghangelang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerTranslion controller = Get.find();
    Timer? timer;
    return Scaffold(
      appBar: AppBar(
        title: Text("16".tr),
      ),
      body: Container(
      width: Get.width,height: Get.height,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: Get.width/2,
              child: SpringButton(
                SpringButtonType.OnlyScale,
                row(
                  "3".tr,
                  Colorss.secondcolor,
                ),
                onTapDown: (_) {
                  controller.changlang("en");
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
            Container(
              height: 80,
                width: Get.width/2,
              child: SpringButton(
                SpringButtonType.OnlyScale,
                row(
                  "4".tr,
                  Colorss.secondcolor,
                ),
                onTapDown: (_) {controller.changlang("ar");},
                onLongPress: () => timer = Timer.periodic(
                  const Duration(milliseconds: 1),
                  (_) => (_) {},
                ),
                onLongPressEnd: (_) {
                  timer?.cancel();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
