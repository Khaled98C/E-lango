// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controller/ControllerReviwe/ControllerReviewAnimals.dart';

import '../Static/ClassApp.dart';
import '../Static/Colors.dart';
import '../view/widget/ReveiweLetters/dot.dart';

class PageViewAlpheat4 extends StatefulWidget {
  const PageViewAlpheat4();

  @override
  State<PageViewAlpheat4> createState() => _PageViewAlpheat4State();
}

class _PageViewAlpheat4State extends State<PageViewAlpheat4> {
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
    ControllerReviewAnimals controller = Get.put(ControllerReviewAnimals());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "22".tr,
          style: ClassApp.appbar.headline2,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffc385c7),
        leading: Container(
              height: 60,
              width: 60,
              child: IconButton(
                 icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),)),
        elevation: 0,
        actions: [
          GetBuilder<ControllerReviewAnimals>(
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
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 268,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    width: width,
                    height: 300,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/one.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    width: width + 30,
                    height: 300,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/two.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Center(
                      child: Container(
                    child:
                        Lottie.asset("Lelottie/cute-tiger.json", repeat: true),
                    height: MediaQuery.of(context).size.height - 250,
                    width: MediaQuery.of(context).size.width - 200,
                  )),
                ],
              ),
            ),
            GetBuilder<ControllerReviewAnimals>(
              builder: (controller) => Container(
                height: MediaQuery.of(context).size.height - 550,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset(controller.data[controller.index]['image'],
                    width: double.infinity),
              ),
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
                          child: GetBuilder<ControllerReviewAnimals>(
                            builder: (controller) => dot(
                              isActive: index == controller.index,
                            ),
                          ),
                        )),
              ],
            ),
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
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colorss.primrycolor),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "اسم الحيوان",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        width: 110,
                        height: 60,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.horse,
                              size: 20,
                              color: Colorss.primrycolor,
                            ),
                            GetBuilder<ControllerReviewAnimals>(
                              builder: (controller) => Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Expanded(
                                  child: Text(
                                    controller.data[controller.index]["name"],
                                    style: ClassApp.textReview.headline4,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
