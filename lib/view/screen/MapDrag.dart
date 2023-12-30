import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerDrag/ControllerMapDrag.dart';
import 'package:project/view/widget/mapDrag/NumberLevelDraag.dart';

import '../widget/GamemapTrueFalse/button_back.dart';
import '../widget/GamemapTrueFalse/level.dart';
import '../widget/HandlScreen.dart';

class MapDrag extends StatelessWidget {
const MapDrag({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     ControllerMapDrag controller = Get.put(  ControllerMapDrag ());
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/map5.jpg",
              ),
            )),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                ButtonBack(),
                SizedBox(height: 50),
                Level(),
                GetBuilder< ControllerMapDrag>(
                  builder: (controller) {
                    return HandilingdataView(
                        statusRequest: controller.statusRequest,
                        widget: NumberLevelDraag());
                  },
                ),
              ],
            ))));
  }
}