import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/Changetheme.dart';



class Buttonchangtheme extends GetView<Changetheme> {
  const Buttonchangtheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: controller.isDark
              ? controller.primarycolordark
              : controller.primarycolorligth,
          boxShadow: [
            BoxShadow(
              offset: Offset(-10, 10),
              blurRadius: 10,
              color: controller.isDark ? Color(0xff121625) : Colors.white,
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            if (Get.isDarkMode) {
              controller.ligthmode();
              
            } else {
              controller.darkmode();

            
            }
          },
          icon: Icon(
            Icons.power_settings_new,
            size: 40,
            color: controller.isDark
                ? controller.primarycolorligth
                : controller.primarycolordark,
          ),
        ));
  }
}
