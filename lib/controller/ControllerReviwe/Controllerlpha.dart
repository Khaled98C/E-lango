// ignore_for_file: dead_code

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

import 'package:get/get.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:translator/translator.dart';

class ControllerAlph extends GetxController {
  late AudioPlayer play;

  late GlobalKey<FormState> formstate;
  bool loading = false;
  int index = 0;
  bool isPlaying = false;
  late TextEditingController textuseraudio;
  late FlutterTts fluttertss;
  GoogleTranslator translator = GoogleTranslator();
  late TextEditingController userinputwordtransliton;
  Translation? outputwordtransliton;
  late StatusRequest statusRequest;
  @override
  void onInit() {
    super.onInit();
    fluttertss = FlutterTts();
    userinputwordtransliton = TextEditingController();
    textuseraudio = TextEditingController();
    play = AudioPlayer();
    formstate = GlobalKey<FormState>();
  }

  texttospeek(String text) async {
    String checkla = negativegetlang(selectedValue);
    
   
    await fluttertss.setLanguage(checkla);
    await fluttertss.setVolume(1);
    await fluttertss.setSpeechRate(0.4);
    await fluttertss.setPitch(3);
    await fluttertss.speak(text);
   
   
  }

  final List<String> langitems = ['English', 'Arabic'];
  String selectedValue = "Arabic";
  chechselectkey(String key) {
    if (key == "English") {
      return "en";
    } else
      return "ar";
  }

  negativegetlang(String key) {
    if (key == "English") {
      return "ar";
    } else
      return "en";
  }

  String getlang() {
    String key = selectedValue;
    if (key == "English") {
      return "Arabic";
    } else
      return "Arabic";

    update();
  }

  translitonmethod() async {
    if (formstate.currentState!.validate()) {
      String word = userinputwordtransliton.text;
      String check = chechselectkey(selectedValue);
      loading = true;
      update();
      Translation translation = await translator.translate(word, to: check);
      outputwordtransliton = translation;
      print("translation Success");
      print(translation);
      loading = false;
      update();
      return outputwordtransliton;
    }
  }

  String negvalue = "English";
  String negativeonchange(value) {
    negvalue = value;
    update();
    if (selectedValue == 'Arabic') {
      return negvalue = 'English';
      update();
    } else {
      return negvalue = 'Arabic';
      update();
    }
    update();
  }

  onchange(String value) {
    selectedValue = value;

    update();
  }

  final List data = [
    {
      "name": "Alpha",
      "Word": "Aa",
      "audiopath": "a.mp3",
      'image': "Lelottie/a.gif",
    },
    {
      "name": "Basel",
      "Word": "B",
      "audiopath": "B.mp3",
      'image': "Lelottie/b.gif",
    },
    {
      "name": "Car",
      "Word": "Cc",
      "audiopath": "C.mp3",
      'image': "Lelottie/c.gif",
    },
    {
      "name": "Door",
      "Word": "Dd",
      "audiopath": "D.mp3",
      'image': "Lelottie/d.gif",
    },
    {
      "name": "Elephent",
      "Word": "Ee",
      "audiopath": "E.mp3",
      'image': "Lelottie/e.gif",
    },
    {
      "name": "Four",
      "Word": "Ff",
      "audiopath": "F.mp3",
      'image': "Lelottie/f.gif",
    },
    {
      "name": "Good",
      "Word": "Gg",
      "audiopath": "G.mp3",
      'image': "Lelottie/g.gif",
    },
    {
      "name": "Horse",
      "Word": "Hh",
      "audiopath": "H.mp3",
      'image': "Lelottie/h.gif",
    },
    {
      "name": "Icon",
      "Word": "Ii",
      "audiopath": "I.mp3",
      'image': "Lelottie/i.gif",
    },
    {
      "name": "Jub",
      "Word": "Jj",
      "audiopath": "J.mp3",
      'image': "Lelottie/j.gif",
    },
    {
      "name": "Khaled",
      "Word": "Kk",
      "audiopath": "K.mp3",
      'image': "Lelottie/k.gif",
    },
    {
      "name": "Lemon",
      "Word": "Ll",
      "audiopath": "L.mp3",
      'image': "Lelottie/l.gif",
    },
    {
      "name": "Mouse",
      "Word": "Mm",
      "audiopath": "M.mp3",
      'image': "Lelottie/m.gif",
    },
    {
      "name": "Nourth",
      "Word": "Nn",
      "audiopath": "N.mp3",
      'image': "Lelottie/n.gif",
    },
    {
      "name": "Oil",
      "Word": "Oo",
      "audiopath": "O.mp3",
      'image': "Lelottie/o.gif",
    },
    {
      "name": "Person",
      "Word": "Pp",
      "audiopath": "P.mp3",
      'image': "Lelottie/p.gif",
    },
    {
      "name": "Quit",
      "Word": "Qq",
      "audiopath": "Q.mp3",
      'image': "Lelottie/q.gif",
    },
    {
      "name": "Rice",
      "Word": "Rr",
      "audiopath": "R.mp3",
      'image': "Lelottie/r.gif",
    },
    {
      "name": "Sky",
      "Word": "Ss",
      "audiopath": "S.mp3",
      'image': "Lelottie/s.gif",
    },
    {
      "name": "Text",
      "Word": "Tt",
      "audiopath": "T.mp3",
      'image': "Lelottie/t.gif",
    },
    {
      "name": "Uae",
      "Word": "Uu",
      "audiopath": "U.mp3",
      'image': "Lelottie/u.gif",
    },
    {
      "name": "Vector",
      "Word": "Vv",
      "audiopath": "V.mp3",
      'image': "Lelottie/v.gif",
    },
    {
      "name": "White",
      "Word": "Ww",
      "audiopath": "W.mp3",
      'image': "Lelottie/w.gif",
    },
    {
      "name": "Xor",
      "Word": "Xx",
      "audiopath": "X.mp3",
      'image': "Lelottie/x.gif",
    },
    {
      "name": "Yousef",
      "Word": "Yy",
      "audiopath": "Y.mp3",
      'image': "Lelottie/y.gif",
    },
    {
      "name": "Zoo",
      "Word": "Zz",
      "audiopath": "Z.mp3",
      'image': "Lelottie/z.gif",
    },
  ];
}
