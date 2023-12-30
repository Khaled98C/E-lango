import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/Changetheme.dart';

class ShapeSun extends GetView<Changetheme> {
  const ShapeSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: controller.isDark
                    ? [
                        Color(0XFF30218f),
                        Color(0XFF8d81dd),
                      ]
                    : [
                        Color(0XFFFFCC81),
                        Color(0XFFFF6E30),
                        Colors.yellow,
                      ]),
          ),
        ),
        AnimatedPositioned(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.isDark
                    ? controller.primarycolordark
                    : controller.primarycolorligth,
              ),
            ),
            top: controller.isDark ? -40 : -210,
            right: controller.isDark ? -40 : -210,
            duration: Duration(milliseconds: 200))
      ],
    );
  }
}
