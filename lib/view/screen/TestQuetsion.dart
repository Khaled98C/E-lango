import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/ClassApp.dart';

import '../../controller/ControllerTestQuetsion.dart';
import '../widget/testquetsion/FisrtAndSecdondButton.dart';
import '../widget/testquetsion/ThreeFourbottun.dart';
import '../widget/testquetsion/head.dart';

class TestQuetsionScreen extends StatelessWidget {
  const TestQuetsionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerTestQuetsion controller = Get.put(ControllerTestQuetsion(context: context));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "42".tr,
            style: ClassApp.appbar.headline2,
          ),
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              HeadTestQuetsion(),
              
              FisrtAndSecdondButton(),
              ThreeFourbottun(),
            ],
          ),
        ));
  }
}
