import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/Model/TrueOrFalseModel.dart';

import 'package:flutter/material.dart';
import 'package:project/view/widget/AudioPlayerPage/AppBarAudioPlayer.dart';
import 'package:project/view/widget/HandlScreen.dart';
import 'package:project/view/widget/TrueorFalsePage/TrueOrFalseDataModel.dart';
import 'package:spring_button/spring_button.dart';

import '../../controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';

class Pagetrueorfalse extends StatefulWidget {
  const Pagetrueorfalse({Key? key}) : super(key: key);

  @override
  _PagetrueorfalseState createState() => _PagetrueorfalseState();
}

class _PagetrueorfalseState extends State<Pagetrueorfalse> {
  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerTrueOrFalseData(context: context));
    return Scaffold(
        appBar: AppBarScreenTruePageAudio(
          title: "35".tr,
        ),
        body: GetBuilder<ControllerTrueOrFalseData>(
          builder: (controller) => HandilingdataView(
              onRefresh: controller.onRefres,
              statusRequest: controller.statusRequest,
              widget: GetBuilder<ControllerTrueOrFalseData>(
                  builder: (controller) => TrueOrFalseDataModel(
                        model: ModelTrueOrFalse.fromJson(
                            controller.data[controller.quetionNumber]),
                      ))),
        ));
  }
}
