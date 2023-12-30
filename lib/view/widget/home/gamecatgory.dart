import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Gamecatgory extends StatelessWidget {
  const Gamecatgory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      child:Text("5".tr,
          style:
              TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 25,
          )),
    );
  }
}
