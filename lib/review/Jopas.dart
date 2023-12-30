// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controller/ControllerReviwe/ControllerReviweJubs.dart';

import '../Static/ClassApp.dart';
import '../view/widget/ReveiweLetters/dot.dart';

class PageViewAlpheat5 extends StatefulWidget {
  const PageViewAlpheat5();

  @override
  State<PageViewAlpheat5> createState() => _PageViewAlpheat5State();
}

class _PageViewAlpheat5State extends State<PageViewAlpheat5> {
  late PageController _pageController;
  int _pageindex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerReviweJubs controller = Get.put(ControllerReviweJubs());
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<ControllerReviweJubs>(
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
        title: Text("24".tr,style: ClassApp.appbar.headline2,),
        leading:Container(
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
          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    width: width + 30, left: 0,
                    height: 300,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/two.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Center(
                      child: Container(
                    child: Lottie.asset("Lelottie/jopes.json"),
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width - 120,
                  )),
                ],
              ),
            ),
            GetBuilder<ControllerReviweJubs>(
              builder: (controller) => Container(
                height: MediaQuery.of(context).size.height - 550,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(controller.data[controller.index]['image'],
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
                          child: GetBuilder<ControllerReviweJubs>(
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
