import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerZoo.dart';

class Zoo extends StatefulWidget {
  @override
  _ZooState createState() => _ZooState();
}

class _ZooState extends State<Zoo> {
  @override
  Widget build(BuildContext context) {
    ControllerZoo controller = Get.put(ControllerZoo());
    return Scaffold(
      body: PageView.builder(
        itemCount:controller.pages.length,
        itemBuilder: (context, position) =>controller.pages[position],
      ),
    );
  }
}
