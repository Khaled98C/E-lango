
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:easy_stepper/easy_stepper.dart';

import 'package:project/view/widget/GamemapTrueFalse/Score.dart';
import 'package:project/view/widget/HandlScreen.dart';

import '../../controller/ControllerTrueOrfalse/ControllermapPageTrueOrFalse.dart';
import '../widget/GamemapTrueFalse/button_back.dart';
import '../widget/GamemapTrueFalse/level.dart';
import '../widget/GamemapTrueFalse/number_of_level.dart';

class MapGameTrueFalse extends StatelessWidget {
  MapGameTrueFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapPageTrueOrFalseController controller =
        Get.put(MapPageTrueOrFalseController());
    double he = Get.height;
    print(he);
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Level(), Score()],
                  ),
                ),
                GetBuilder<MapPageTrueOrFalseController>(
                  builder: (controller) {
                    return HandilingdataView(onRefresh: controller.onRefres,
                        statusRequest: controller.statusRequest,
                        widget: NumberOfLevelTrueOrFalse());
                  },
                ),
              ],
            ))));
    // floatingActionButton: FloatingActionButton(
    //   backgroundColor: Colors.black,
    //   child: Icon(
    //     Icons.add,
    //     color: Colors.white,
    //   ),
    //   onPressed: () {},
    // ),

    /*GetBuilder<Gamecontroller>(
          builder: (controller) => Stack(
            children: [
              Container(
                width: Get.width - 100,
                height: Get.height,
                child: Image(
                  image: AssetImage("images/map.jpg"),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(() => Pagetrueorfalse());
                        },
                        child: Hero(
                          tag: index,
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.yellow),
                            alignment: Alignment.center,
                            child: Text(
                              "$index",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        )*/
    //  Padding(
    //   padding: const EdgeInsets.all(20.0),
    //   child: Container(height:Get.height,
    //   width:Get.width,
    //     child: GameLevelsScrollingMap.scrollable(
    //       imageUrl: "assets/drawable/map_vertical.png",
    //       direction: Axis.vertical,
    //       reverseScrolling: true,
    //       svgUrl: 'assets/svg/map_vertical.svg',
    //       points: points,
    //     ),
    //   ),
    // )
  }
}
