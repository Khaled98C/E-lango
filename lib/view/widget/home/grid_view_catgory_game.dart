import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/Model/CatgoryHomeModel.dart';
import 'package:project/controller/Controllerhome.dart';

import 'package:project/view/widget/home/imagecatgory.dart';


class GridViewCatgoryGame extends GetView<Controllerhome> {
  const GridViewCatgoryGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/4,
      child: GridView.builder(
        itemCount: controller.catgory.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => InkWell(
            splashColor: index.isEven
                ? Color.fromARGB(255, 140, 208, 242)
                : Color(0xffa53ff9).withOpacity(0.7),
            onTap: () {
              controller.gotomap((index + 1).toString());
            },
          
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: Get.height/4,
                  width: Get.width/4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: index.isOdd
                        ? Color(0xff7945a2)
                        : Color(0xffa53ff9).withOpacity(0.7),
                  ),
                  child: Stack(
                    children: [
                      Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Imagecatgory(
                            categormodel: CategoryModel.fromJson(
                                controller.catgory[index])),
                      )),
                    ],
                  ),
                )),
      ),
    );
  }
}
