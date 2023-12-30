import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ControllerReviewAnimals extends GetxController {
  late AudioPlayer play;
  int index = 0;
  @override
  void onInit() {
    super.onInit();

    play = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      "name": "Cat",
      'audiopath': "cat.mp3",
      'image': "Lelottie/cat.json",
    },
    {
      "name": "Dog",
      'audiopath': "dog.mp3",
      'image': "Lelottie/dog.json",
    },
    {
      "name": "Bat",
      'audiopath': "bat.mp3",
      'image': "Lelottie/bat.json",
    },
    {
      "name": "Bee",
      'audiopath': "Bee.mp3",
      'image': "Lelottie/bee.json",
    },
    {
      "name": "Bird",
      'audiopath': "bird.mp3",
      'image': "Lelottie/bird.json",
    },
    {
      "name": "Bull",
      'image': "Lelottie/bull.json",
      'audiopath': "bull.mp3",
    },
    {
      "name": "Cheetah",
      'audiopath': "Cheetah.mp3",
      'image': "Lelottie/cheetah.json",
    },
    {
      "name": "Chicken",
      'audiopath': "chicken.mp3",
      'image': "Lelottie/chicken.json",
    },
    {
      "name": "Cow",
      'audiopath': "cow.mp3",
      'image': "Lelottie/cow.json",
    },
    {
      "name": "Crab",
      'audiopath': "crab.mp3",
      'image': "Lelottie/crab.json",
    },
    {
      "name": "Deer",
      'audiopath': "Deer.mp3",
      'image': "Lelottie/deer.json",
    },
    {
      "name": "Dolphin",
      'audiopath': "Dolphin.mp3",
      'image': "Lelottie/dolphin.json",
    },
    {
      "name": "Duck",
      'audiopath': "Duck.mp3",
      'image': "Lelottie/duck.json",
    },
    {
      "name": "Elephant",
      'audiopath': "Elephant.mp3",
      'image': "Lelottie/elephant.json",
    },
    {
      "name": "Fish",
      'audiopath': "fish.mp3",
      'image': "Lelottie/fishy.json",
    },
    {
      "name": "Fox",
      'audiopath': "fox.mp3",
      'image': "Lelottie/fox.json",
    },
    {
      "name": "Frog",
      'audiopath': "frog.mp3",
      'image': "Lelottie/frog.json",
    },
    {
      "name": "Girafe",
      'audiopath': "girafe.mp3",
      "image": "Lelottie/girafe.json",
    },
    {
      "name": "Hedgehog",
      "audiopath": "hedgehog.mp3",
      "image": "Lelottie/hedgehog.json",
    },
    {
      "name": "Koala",
      "audiopath": "koala.mp3",
      "image": "Lelottie/koala.json",
    },
    {
      "name": "Lion",
      "audiopath": "lion.mp3",
      "image": "Lelottie/lion.json",
    },
    {
      "name": "Monkey",
      "audiopath": "Monkey.mp3",
      "image": "Lelottie/monkey.json",
    },
    {
      "name": "Mouse",
      "audiopath": "mouse.mp3",
      "image": "Lelottie/mouse.json",
    },
    {
      "name": "Octopus",
      "audiopath": "Octopus.mp3",
      "image": "Lelottie/octopus.json",
    },
    {
      "name": "Owl",
      "audiopath": "owl.mp3",
      "image": "Lelottie/owl.json",
    },
    {
      "name": "Panda",
      "audiopath": "panda.mp3",
      "image": "Lelottie/panda.json",
    },
    {
      "name": "Penguin",
      "audiopath": "Penguin.mp3",
      "image": "Lelottie/penguin.json",
    },
    {
      "name": "Pig",
      "audiopath": "Pig.mp3",
      "image": "Lelottie/pig.json",
    },
    {
      "name": "Rabbit",
      "audiopath": "Rabbit.mp3",
      "image": "Lelottie/rabbit.json",
    },
    {
      "name": "Rhino",
      "audiopath": "Rhino.mp3",
      "image": "Lelottie/rhino.json",
    },
    {
      "name": "Seal",
      "audiopath": "seal.mp3",
      "image": "Lelottie/seal.json",
    },
    {
      "name": "Shark",
      "audiopath": "Shark.mp3",
      "image": "Lelottie/shark.json",
    },
    {
      "name": "Sheep",
      "audiopath": "sheep.mp3",
      "image": "Lelottie/sheep.json",
    },
    {
      "name": "Snake",
      "audiopath": "snake.mp3",
      "image": "Lelottie/snake.json",
    },
    {
      "name": "Spider",
      "audiopath": "spider.mp3",
      "image": "Lelottie/spider.json",
    },
    {
      "name": "Tiger",
      "audiopath": "Tiger.mp3",
      "image": "Lelottie/tiger.json",
    },
    {
      "name": "Turtle",
      "audiopath": "turtle.mp3",
      "image": "Lelottie/turtle.json",
    },
    {
      "name": "Whale",
      "audiopath": "whale.mp3",
      "image": "Lelottie/whale.json",
    },
    {
      "name": "Wolf",
      "audiopath": "wolf.mp3",
      "image": "Lelottie/wolf.json",
    },
  ];
}
