import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/ClassApp.dart';

import '../../../Static/Colors.dart';
import '../../../controller/ControllerReviwe/ControllerReviweletters.dart';

class CustomDetials extends GetView<ControllerReviweLetters> {
  const CustomDetials(  {Key? key,required this.title,required this.color,required this.data}) : super(key: key);
  final String title;
    final Color color ;
    final String data;
    
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: color),
      child: Column(
        children: [
          Container(
            child: Text(
              title,
            style: ClassApp.textReview.headline4,
            ),
          ),
          Container(
             margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
            ),height: 60,
            width: 110,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.abc,
                  size: 30,
                  color: Colorss.primrycolor,
                ),
                GetBuilder<ControllerReviweLetters>(
                  builder: (controller) =>
                      Text(controller.data[controller.index][data],style: ClassApp.textReview.headline4,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
