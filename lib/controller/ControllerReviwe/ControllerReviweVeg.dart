import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ControllerReviweVeg extends GetxController {
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
      "audiopath": "apple.mp3",
      "name": "Apple",
      "image": "Lelottie/apple.json",
    },
    {
      "audiopath": "banana.mp3",
      "image": "Lelottie/banana.json",
      "name": "Banana",
    },
    {
      "audiopath": "orange.mp3",
      "image": "Lelottie/orange.json",
      "name": "Orange",
    },
    {
      "audiopath": "strawberry.mp3",
      "image": "Lelottie/strawberry.json",
      "name": "Strawberry",
    },
    {
      "audiopath": "tomato.mp3",
      "image": "Lelottie/tomato.json",
      "name": "Tomato",
    },
    {
      "audiopath": "watermelon.mp3",
      "name": "Watermelon",
      "image": "Lelottie/watermelon.json",
    },
  ];
}
