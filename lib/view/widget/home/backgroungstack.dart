import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class Backgroungstack extends StatelessWidget {
  Backgroungstack({Key? key, required this.lottie}) : super(key: key);
  final String lottie;
  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
      height: Get.height / 2.80,
      child: Stack(
        children: [
          Positioned(
            top: -40,
            width: width,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/one.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: width + 30,
            left: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/two.png"), fit: BoxFit.fill)),
            ),
          ),
          Center(
              child: Container(
            child: Lottie.asset(lottie, repeat: false),
            height: Get.height - 200,
            width: Get.width - 120,
          ))
        ],
      ),
    );
  }
}
