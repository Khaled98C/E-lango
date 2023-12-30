import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/widget/Zoo/FrethFron.dart';
import '../view/widget/Zoo/Fronepage.dart';
import '../view/widget/Zoo/FrownTwo.dart';

class ControllerZoo extends GetxController {
  late AudioPlayer player;
  List<Widget> pages = [FronePage(), FrtwoPage(), FrthreePage()];
  @override
  void onInit() {
    super.onInit();
    player = AudioPlayer();
  }
}
