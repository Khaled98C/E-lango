import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerMultiChoisi/ControllermapPageAudioPlayer.dart';
import 'package:project/view/widget/GameMapAudioPlayer/NumberofLevel.dart';
import 'package:project/view/widget/GameMapAudioPlayer/level.dart';
import 'package:project/view/widget/GamemapTrueFalse/level.dart';
import 'package:project/view/widget/HandlScreen.dart';

import '../widget/GameMapAudioPlayer/Score.dart';
import '../widget/GamemapTrueFalse/Score.dart';
import '../widget/GamemapTrueFalse/button_back.dart';

class MapGameAudioPlayer extends StatelessWidget {
  MapGameAudioPlayer({Key? key}) : super(key: key);
  ControllermapofLevelAudioPlayer controller =
      Get.put(ControllermapofLevelAudioPlayer());
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Level(),
                      GetBuilder<ControllermapofLevelAudioPlayer>(
                          builder: (controller) => ScoreAudioplayer())
                    ],
                  ),
                ),
                //MapGameAudioPlayer(),
                GetBuilder< ControllermapofLevelAudioPlayer>(
                    builder: (controller) => HandilingdataView(
                        statusRequest: controller.statusRequest,
                        widget: NumberofLevelAudioPlayer(),
                        onRefresh: controller.onRefres)),
              ],
            ))));
  }
}
