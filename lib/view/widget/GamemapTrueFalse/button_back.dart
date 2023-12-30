import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)));
  }
}
