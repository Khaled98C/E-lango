import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Static/ClassApp.dart';

class AvatarAbout extends StatelessWidget {
  const AvatarAbout({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 50,
          backgroundColor: Color(0xffa53ff9).withOpacity(0.7),
          child: Container(
            height: Get.height,
            width: Get.width,
            child: ClipRRect(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Text(
          text,
          style:  ClassApp.aboutus.headline1,
        )
      ],
    );
  }
}
