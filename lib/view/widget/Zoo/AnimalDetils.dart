import 'package:audioplayers/audioplayers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/ClassApp.dart';

import '../../../controller/ControllerZoo.dart';

class AnimalDetils extends StatelessWidget {
  final String animalname;
  final String soundname;
  final String titleEnglish;
  final String titlearabic;
  final String image;
  final String sound;
  final String flipen;
  final String flipar;
  const AnimalDetils(
      {super.key,
      required this.animalname,
      required this.titleEnglish,
      required this.titlearabic,
      required this.image,
      required this.sound,
      required this.flipen,
      required this.flipar, required this.soundname});
  @override
  Widget build(BuildContext context) {
    ControllerZoo controller = Get.find();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/zz.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 125,
            ),
            Container(
                margin: EdgeInsets.only(right: 300),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                )),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    //   plyr.play('Armadillo.mp3');
                    controller.player.play(AssetSource('$soundname.mp3'));
                  },
                  child: Container(
                    width: 70,
                    height: 50,
                    color: Colors.deepOrangeAccent,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  animalname,
                  style: ClassApp.animaltitle.headline1
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FlipCard(
              front: Text(
                titleEnglish,
                style: ClassApp.animaldetils.headline1
              ),
              back: Text(
                titlearabic,
                style: ClassApp.animaldetils.headline1
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image(
                image: AssetImage('assets/$image.png'),
                height: 230,
                width: 420,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    //   plyr.play('Armadillo.mp3');
                    controller.player.play(AssetSource('$sound.mp3'));
                  },
                  child: Container(
                    width: 70,
                    height: 50,
                    color: Colors.deepOrangeAccent,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  'Play Sound',
                  style:ClassApp.animaldetils.headline1
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            FlipCard(
              front: Text(
                flipen,
                style:ClassApp.animaldetils.headline1
              ),
              back: Text(
                flipar,
                style: ClassApp.animaldetils.headline1
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
