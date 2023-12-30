


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:project/controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';
import 'package:project/view/widget/AudioPlayerPage/AppBarAudioPlayer.dart';
import 'package:project/view/widget/AudioPlayerPage/FirstRowButton.dart';
import 'package:project/view/widget/AudioPlayerPage/LotteAudioPlayer.dart';
import 'package:project/view/widget/AudioPlayerPage/SecondRowButton.dart';
import 'package:project/view/widget/HandlScreen.dart';


import '../../Static/ClassApp.dart';
import '../widget/AudioPlayerPage/HeadPageAudio.dart';

class PageAudioPlayer extends StatelessWidget {
  PageAudioPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerAudioPlayerData controller =
        Get.put(ControllerAudioPlayerData(context: context));
    return Scaffold(
      appBar: AppBarScreenTruePageAudio(title: "34".tr),
      body: GetBuilder<ControllerAudioPlayerData>(
        builder: (controller) => HandilingdataView(onRefresh:controller.onRefres ,
          statusRequest: controller.statusRequest,
          widget: Container(
              child: Column(
            children: [
              GetBuilder<ControllerAudioPlayerData>(
                builder: (controller) => HeadPageAudio(),
              ),
              //! image
              GetBuilder<ControllerAudioPlayerData>(
                  builder: (controller) => LotteAudioPlayer()
                  ),
              FirstRowButton(),
              SecondRowButton(),
            ],
          )),
        ),
      ),
    );
  }
}
