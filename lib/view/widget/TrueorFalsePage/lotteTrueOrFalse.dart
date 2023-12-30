import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';

class LotteTrueOrFalse extends GetView<ControllerTrueOrFalseData> {
  const LotteTrueOrFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
      height: Get.height - 600,
      width: Get.width - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
            "images/${controller.data[controller.quetionNumber]['question_image']}"
            //data[que]['image'],
            ),
      ),
    );
  }
}
