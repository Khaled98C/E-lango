import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/ControllerTestQuetsion.dart';

class HeadTestQuetsion extends GetView<ControllerTestQuetsion> {
  const HeadTestQuetsion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
      height: 270,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 420,
              height: 140,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  GetBuilder<ControllerTestQuetsion>(builder: (controller) {
                    return LinearPercentIndicator(
                      width: Get.width - 40,
                      lineHeight: 25,
                      percent: (controller.i / controller.data.length) > 1
                          ? (controller.i / controller.data.length)
                              .floor()
                              .toDouble()
                          : (controller.i / controller.data.length),
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xFF8BC34A),
                      barRadius: Radius.circular(25),
                      animation: true,
                      curve: Curves.easeIn,
                      animateFromLastPercent: true,
                    );
                  }),
                ],
              ),
            ),
          ),
          GetBuilder<ControllerTestQuetsion>(
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    color: Colors.white,
                    child: controller.data[controller.quetionNumber].name
                            .endsWith(".gif")
                        ? Image.asset(
                            "Lelottie/${controller.data[controller.quetionNumber].name}",
                            height: Get.height / 4,
                            width: Get.width,
                            fit: BoxFit.fill,
                          )
                        : Lottie.asset(
                            "Lelottie/${controller.data[controller.quetionNumber].name}",
                            height: Get.height / 4,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
