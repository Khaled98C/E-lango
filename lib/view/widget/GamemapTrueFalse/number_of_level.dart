import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:project/model/truefalsemodel.dart';


import '../../../controller/ControllerTrueOrfalse/ControllermapPageTrueOrFalse.dart';

import '../../../newservers/newserves.dart';
import 'gotogame.dart';

class NumberOfLevelTrueOrFalse extends GetView<MapPageTrueOrFalseController> {
  NumberOfLevelTrueOrFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapPageTrueOrFalseController controller = Get.find();
    MyServices myServices=Get.find();
   
    return GetBuilder<MapPageTrueOrFalseController>(
      builder: (controller) {
        return Container(
          height: Get.height/2,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 10),
            borderRadius: BorderRadius.circular(50),
            color: Color(0xfff7e2a9),
          ),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.mapcatgory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return 
               
                      Padding(
                          padding: const EdgeInsets.all(7.0),
                          child:Gotogame(model: Classtruemodel.fromJson(controller.mapcatgory[index]),) 
                        );
              }),
        );
      },
    );
  }
}
