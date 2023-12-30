// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Static/Colors.dart';
import 'package:project/controller/ControllerReviwe/ControllerReviweletters.dart';
import 'package:project/view/widget/ReveiweLetters/CustomDetials.dart';

import '../Static/ClassApp.dart';
import '../view/widget/ReveiweLetters/dot.dart';
import '../view/widget/TransltionPage/head_background_abcd.dart';

class PageViewAlpheat extends StatefulWidget {
  const PageViewAlpheat();

  @override
  State<PageViewAlpheat> createState() => _PageViewAlpheatState();
}

class _PageViewAlpheatState extends State<PageViewAlpheat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    ControllerReviweLetters controller = Get.put(ControllerReviweLetters());
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<ControllerReviweLetters>(
            builder: (controller) => Container(
                height: 70,
                width: 70,
                child: InkWell(
                    child: Lottie.asset("Lelottie/spekar2.json",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity),
                    onTap: () {
                      controller.play.play(AssetSource(
                          controller.data[controller.index]['audiopath']));
                    })),
          )
        ],
        title: Text("21".tr,style: ClassApp.appbar.headline2,),
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
      body: Container(
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadBackgroundAbcd (),
            GetBuilder<ControllerReviweLetters>(
              builder: (controller) => Container(
                  height: MediaQuery.of(context).size.height - 550,
                  width: MediaQuery.of(context).size.width,
                  child:
                     Image.asset(controller.data[controller.index]['image'],fit: BoxFit.cover,)),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              textDirection: TextDirection.ltr,
              direction: Axis.horizontal,
              children: [
                ...List.generate(
                    controller.data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GetBuilder<ControllerReviweLetters>(
                            builder: (controller) => dot(
                              isActive: index == controller.index,
                            ),
                          ),
                        )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        child: InkWell(
                          child: Lottie.asset("Lelottie/arrowleft.json",
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity),
                          onTap: () {
                            controller.previousPage();
                            print(controller.index);
                          },
                        )),
                    CustomDetials(
                        title: "شكل الحرف",
                        color: Colorss.primrycolor,
                        data: "Word"),
                    GetBuilder<ControllerReviweLetters>(
                      builder: (_) {
                        return CustomDetials(
                            title: ("كلمات"),
                            color: Colorss.secondcolor,
                            data: "name");
                      },
                    ),
                    Container(
                        height: 70,
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            print(controller.index);

                            controller.nextpage();
                          },
                          child: Lottie.asset("Lelottie/arrowright.json",
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity),
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
