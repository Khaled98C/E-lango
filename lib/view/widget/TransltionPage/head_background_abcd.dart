import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HeadBackgroundAbcd extends StatelessWidget {
  const HeadBackgroundAbcd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final double width = Get.width;
    return Container(
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
                      image: AssetImage("images/one.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: width + 30,
            height: 300, left: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/two.png"), fit: BoxFit.fill)),
            ),
          ),
          Center(
              child: Container(
            child: Lottie.asset("Lelottie/Alphabet.json"),
            height: MediaQuery.of(context).size.height - 250,
            width: MediaQuery.of(context).size.width - 200,
          )),
        ],
      ),
    );
  }
}
