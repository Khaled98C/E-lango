import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Arrowback extends StatelessWidget {
const Arrowback({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                );
  }
}