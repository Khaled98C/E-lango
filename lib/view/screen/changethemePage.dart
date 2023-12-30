import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/Changetheme.dart';
import '../widget/changetheme/Buttonchangtheme.dart';
import '../widget/changetheme/ShapeSun.dart';
import '../widget/changetheme/arrowback.dart';
import '../widget/changetheme/title.dart';

class ChangethemePage extends StatelessWidget {
  const ChangethemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    Changetheme controller = Get.find();
    return Scaffold(
      
        body: GetBuilder<Changetheme>(
      builder: (controller) =>  Container(
        
            color: controller.isDark? controller.primarycolordark
              : controller.primarycolorligth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Arrowback(),
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShapeSun(),
                     Titlechangtheme(),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                     Buttonchangtheme(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
