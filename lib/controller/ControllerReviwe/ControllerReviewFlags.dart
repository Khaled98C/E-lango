import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ControllerReviweFlags extends GetxController {
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
    {"name":"Algeria",
      "audiopath": "algeria.mp3",
      "image": "Lelottie/algeria.json",
    },
    {"name":"Egypt",
      "audiopath": "egypt.mp3",
      "image": "Lelottie/egypt.json",
    },
    {"name":"Iraq",
      "audiopath": "iraq.mp3",
      "image": "Lelottie/iraq.json",
    },
    {"name":"Kuwait",
      "audiopath": "kuwait.mp3",
      "image": "Lelottie/kuwait.json",
    },
    {"name":"Morocco",
      "audiopath": "morocco.mp3",
      "image": "Lelottie/morocco.json",
    },
    {"name":"Palestine",
      "audiopath": "palestine.mp3",
      "image": "Lelottie/palestine.json",
    },
    {"name":"SaudiArabia",
      "audiopath": "saudiarabia.mp3",
      "image": "Lelottie/saudi_arabia.json",
    },
    {"name":"Syria",
      "audiopath": "syria.mp3",
      "image": "Lelottie/syria.json",
    },
    {"name":"Tunisia",
      "audiopath": "tunisia.mp3",
      "image": "Lelottie/tunisia.json",
    }
  ];
}
