import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ControllerReviweNumber extends GetxController {
  late AudioPlayer play;
  int index = 0;
  @override
  void onInit() {
    super.onInit();

    play = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  previousPage() {
    if (index == 0) {
      return print(" لا استطيع العودة");
    } else {
      index = index - 1;
    }
    update();
  }

  nextpage() {
    if (index == data.length - 1) {
      return "وصلنا للاخير";
    } else {
      index = index + 1;
      update();
    }
  }

  final List data = [
    {
      "name": "Zero",
      "audiopath": "0.mp3",
      "image": "Lelottie/0.gif",
    },
    {
      "audiopath": "1.mp3",
      "image": "Lelottie/1.gif",
      "name": "One",
    },
    {
      "name": "Two",
      "audiopath": "2.mp3",
      "image": "Lelottie/2.gif",
    },
    {
      "audiopath": "3.mp3",
      "image": "Lelottie/3.gif",
      "name": "Three",
    },
    {
      "name": "Four",
      "audiopath": "4.mp3",
      "image": "Lelottie/4.gif",
    },
    {
      "name": "Five",
      "audiopath": "5.mp3",
      "image": "Lelottie/5.gif",
    },
    {
      "name": "Six",
      "audiopath": "6.mp3",
      "image": "Lelottie/6.gif",
    },
    {
      "name": "Seven",
      "audiopath": "7.mp3",
      "image": "Lelottie/7.gif",
    },
    {
      "name": "Eight",
      "audiopath": "8.mp3",
      "image": "Lelottie/8.gif",
    },
    {
      "audiopath": "9.mp3",
      "image": "Lelottie/9.gif",
      "name": "Nine",
    }
  ];
}
