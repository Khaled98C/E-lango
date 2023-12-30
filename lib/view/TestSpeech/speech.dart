import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speech {
  static final _speech = SpeechToText();
  String language = 'en-US';


  static Future<bool> toggleRecording(
    
      {required Function(String text) onResult,
      required ValueChanged<bool> onListening}) async {


// Some UI or other code to select a locale from the list
// resulting in an index, selectedLocale



    final isAvailable = await _speech.initialize(
      
        onStatus: (status) => onListening(_speech.isListening),
        onError: (error) => print('Error $error'));

    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    if (isAvailable) {
      _speech.listen(onResult: (value) => onResult(value.recognizedWords),  localeId: 'en_US', );
    }

    return isAvailable;
  }
}
