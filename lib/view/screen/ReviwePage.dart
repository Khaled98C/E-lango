import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:project/Review/Backgrounquiz.dart';

import '../../Static/ClassApp.dart';
import '../../controller/ControllerReviwe/ControllerPageReviwe.dart';

class ReviwePage extends StatelessWidget {
  const ReviwePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerPageReviwe controller = Get.put(ControllerPageReviwe());
    return Scaffold(
      appBar: 
      AppBar(
        title: Text(
           '20'.tr,
          style: ClassApp.appbar.headline2,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffc385c7),
        elevation: 0,
      ),
      body: Container(
      
        child: Column(
          children: [
            Backgrounquiz(),
            Container(
              height: Get.height - 370,
              width: Get.width,
              child: GridView.builder(
                itemCount: controller.reviewPage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      controller.goToReview(index + 1);
                    },
                    child: Container(
                      child: Lottie.asset(
                        controller.image[index],
                      ),
                      decoration: BoxDecoration(
                          color: index.isOdd
                              ? Color(0xffc385c7)
                              : Color(0xffa53ff9).withOpacity(0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List Image = [
  "Lelottie/Alphabet.json",
  "Lelottie/animal.json",
  "Lelottie/flags.json",
  "Lelottie/jopes.json",
  "Lelottie/Num.json",
  "Lelottie/vegetable.json",
];
