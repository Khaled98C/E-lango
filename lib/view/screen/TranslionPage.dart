// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Static/ClassApp.dart';

import 'package:project/controller/ControllerReviwe/Controllerlpha.dart';


import '../widget/TransltionPage/drop_down_select_lang.dart';
import '../widget/TransltionPage/head_background_abcd.dart';
import '../widget/TransltionPage/input_translion.dart';
import '../widget/TransltionPage/result_translion.dart';

class TranslionPage extends StatefulWidget {
  const TranslionPage();

  @override
  State<TranslionPage> createState() => _TranslionPageState();
}

class _TranslionPageState extends State<TranslionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controlleran;
  // late Animation animation;

  @override
  void initState() {
    controlleran =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerAlph controller = Get.put(ControllerAlph());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "15".tr,
            style: ClassApp.appbar.headline2,
          ),
          leading: Container(
              height: 60,
              width: 60,
              child: IconButton(
                 icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),)),
          centerTitle: true,
          backgroundColor: Color(0xffc385c7),
          elevation: 0,
        ),
        body: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  HeadBackgroundAbcd(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropDownSelectLang(),
                            Container(
                              child: Text(
                               "40".tr,
                                style: ClassApp.aboutus.headline1,
                              ),
                            ),
                          ],
                        ),
                        const InputTranslion(),
                        Container(
                          width: Get.width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<ControllerAlph>(
                                builder: (controller) => IconButton(
                                  onPressed: () {
                                    controller.isPlaying =
                                        !controller.isPlaying;
                                    controller.isPlaying
                                        ? controlleran.forward()
                                        : controlleran.reverse();

                                    controller.isPlaying == false
                                        ? print("pause")
                                        : controller.texttospeek(controller
                                            .userinputwordtransliton.text);
                                  },
                                  icon: AnimatedIcon(
                                    progress: controlleran,
                                    icon: AnimatedIcons.play_pause,
                                    size: 40,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.translitonmethod();
                                  },
                                  icon: Icon(Icons.translate_outlined)),
                            ],
                          ),
                        ),
                        const ResultTranslion(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
