import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/Changetheme.dart';

class Titlechangtheme extends GetView<Changetheme> {
const Titlechangtheme({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Text(controller.isDark ? "Good\nNight" : "Good\nMorining",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "Cairo",
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: controller.isDark
                                  ? controller.primarycolorligth
                                  : controller.primarycolordark));
  }
}