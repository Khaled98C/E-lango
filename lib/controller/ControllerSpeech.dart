import 'package:get/get.dart';
import 'package:project/view/TestSpeech/speech.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../view/TestSpeech/coomad.dart';

class SpeechVoice extends GetxController {
  SpeechToText speech = SpeechToText();
  String textSample = 'Click button to start recording';
  bool isListening = false;
  String toggleRecording() {
    Speech.toggleRecording(onResult: (String text) {
      print("start voice");
      textSample = text;
    }, onListening: (bool isListening) {
      isListening = true;
      if (isListening == true) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          Utils.scanVoicedText(textSample);
        });
      }
    });
    update();
    return textSample;
  }

 
}
