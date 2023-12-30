import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/Question.dart';

import '../../controller/ControllerMapquetsion.dart';
import '../widget/GamemapTrueFalse/Score4.dart';
import '../widget/GamemapTrueFalse/button_back.dart';
import '../widget/GamemapTrueFalse/level.dart';
import '../widget/HandlScreen.dart';
import '../widget/mapDrag/NumberLevelDraag.dart';
import '../widget/mapDrag/NumberMapQuestion.dart';

class Mapquetsion extends StatelessWidget {
  const Mapquetsion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerMapquetsion controller = Get.put(ControllerMapquetsion());
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/map5.jpg",
              ),
            )),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBack(),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Level(), Score4()],
                  ),
                ),
                GetBuilder<ControllerMapquetsion>(
                  builder: (controller) {
                    return HandilingdataView(
                      statusRequest: controller.statusRequest,
                      widget:  NumberMapQuestion(
                            
                            ),
                    );
                  },
                ),
              ],
            ))));
  }
}
