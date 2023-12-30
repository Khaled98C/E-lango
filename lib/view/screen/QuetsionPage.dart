import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/Textformfield.dart';
import 'package:project/Static/row.dart';
import 'package:project/controller/quetsion/QuetsionController.dart';
import 'package:project/view/widget/HandlScreen.dart';
import 'package:spring_button/spring_button.dart';

import '../../Static/valid.dart';
import '../widget/AudioPlayerPage/AppBarAudioPlayer.dart';
import '../widget/quetsion/Head.dart';

class QuetsionPage extends StatelessWidget {
  const QuetsionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    QuetsionController controller =
        Get.put(QuetsionController(context: context));
    return Scaffold(
      appBar: AppBarScreenTruePageAudio(
        title: "43".tr,
      ),
      body:  SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Head(),
                  Textformfid(
                      mycontroller: controller.usersol,
                      type: TextInputType.text,
                      pass: false,
                      max: 20),
                  Container(
                    height: 80,
                    width: Get.width - 200,
                    child: SpringButton(
                      SpringButtonType.OnlyScale,
                      GetBuilder<QuetsionController>(
                        builder: (controller) => row(
                          "44".tr,
                          Color(0xFF8BC34A),
                        ),
                      ),
                      onTapDown: (_) {
                        controller.checkAnswer(controller.usersol.text);
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
                ],
              ),
            ),
          
      ),
    );
  }
}
