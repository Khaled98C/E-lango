import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';

class LotteAudioPlayer extends GetView<ControllerAudioPlayerData> {
const LotteAudioPlayer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Container(
                  height: Get.height - 600,
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Lottie.asset(
                      "Lelottie/${controller.data[controller.quetionNumber]['question_image']}"
                      //data[que]['image'],
                      ),
                );
  }
}