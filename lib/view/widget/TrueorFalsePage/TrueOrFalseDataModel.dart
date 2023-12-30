import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/Model/TrueOrFalseModel.dart';
import 'package:project/controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';
import 'package:project/view/widget/TrueorFalsePage/ButtonFalse.dart';
import 'package:project/view/widget/TrueorFalsePage/ButtonTrue.dart';
import 'package:project/view/widget/TrueorFalsePage/HeadTrueOrFalse.dart';
import 'package:project/view/widget/TrueorFalsePage/lotteTrueOrFalse.dart';
import 'package:spring_button/spring_button.dart';

class TrueOrFalseDataModel extends GetView<ControllerTrueOrFalseData> {
  TrueOrFalseDataModel({Key? key, required this.model}) : super(key: key);
  ModelTrueOrFalse model;
  @override
  Widget build(BuildContext context) {
    

   

    return Container(
        child: Column(
      children: [
        GetBuilder<ControllerTrueOrFalseData>(
             builder: (controller) =>HeadTrueOrFalse(model: model)
           
                ),
        GetBuilder<ControllerTrueOrFalseData>(
          builder: (controller) => LotteTrueOrFalse(),
        ),
        GetBuilder<ControllerTrueOrFalseData>(
          builder: (controller) =>ButtonTrue(),
        ),
        GetBuilder<ControllerTrueOrFalseData>(
          builder: (controller) => ButtonFalse()
        ),
      ],
    )

        // ClassDataTrueOrFalse(model: ModelTrueOrFalsedata.fromJson(controller.data[1]));

        );
  }
}
