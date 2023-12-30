import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Static/Colors.dart';
import 'package:project/view/TestSpeech/speech.dart';

import 'package:substring_highlight/substring_highlight.dart';

import '../widget/home/backgroungstack.dart';
import 'coomad.dart';

class SpeechTextful extends StatefulWidget {
  const SpeechTextful({Key? key}) : super(key: key);
  @override
  State<SpeechTextful> createState() => _SpeechTextfulState();
}

class _SpeechTextfulState extends State<SpeechTextful> {
  String textSample = 'Click button to start recording';
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Speech Recognition App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FlutterClipboard.copy(textSample);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Text Copied to Clipboard')),
              );
            },
            icon: const Icon(
              Icons.copy,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: AvatarGlow(
        curve: Curves.bounceOut,
        endRadius: 80,
        animate: isListening,
        glowColor: Color(0xFFA53FF9),
        child: FloatingActionButton(
          backgroundColor: Color(0xffF45E29),
          onPressed: toggleRecording,
          child: Icon(
            isListening ? Icons.circle : Icons.mic,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Backgroungstack(lottie: "Lelottie/speakchild.json"),
              Padding(
                padding: const EdgeInsets.only(top: 80).copyWith(bottom: 140),
                child: SubstringHighlight(
                  text: textSample,
                  terms: Command.commands,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: "Cairo",
                  ),
                  textStyleHighlight: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Cairo",
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }

  Future toggleRecording() => Speech.toggleRecording(
      onResult: (String text) => setState(() async {
            textSample = text;

            await Future.delayed(Duration(seconds: 4));
            if (text == "hello how are you") {
              Get.snackbar(" ", " ",
                  forwardAnimationCurve: Curves.easeInOutExpo,
                  margin: EdgeInsets.all(20),
                  borderRadius: 20,
                  backgroundColor: Colors.amber,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 236, 220, 237),
                      Color(0xFFC385C7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadows: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(10, 10))
                  ],
                  titleText: Lottie.asset(
                    "lot/ro.json",
                    fit: BoxFit.fill,
                  ),
                  duration: Duration(seconds: 5),
                  messageText: Text(
                    "هلا انا بخير",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ));
            } else if (text == "do you can help me") {
              Get.snackbar(" ", " ",
                  forwardAnimationCurve: Curves.easeInOutExpo,
                  margin: EdgeInsets.all(20),
                  borderRadius: 20,
                  backgroundColor: Colors.amber,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 236, 220, 237),
                      Color(0xFFC385C7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadows: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(10, 10))
                  ],
                  titleText: Lottie.asset(
                    "lot/ro.json",
                    fit: BoxFit.fill,
                  ),
                  duration: Duration(seconds: 5),
                  messageText: Center(
                    child: Text(
                      "بالطبع استطيع مساعدتك عزيزي",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ));
            } else if (text == "give me one idea") {
              Get.snackbar(" ", " ",
                  forwardAnimationCurve: Curves.easeInOutExpo,
                  margin: EdgeInsets.all(20),
                  borderRadius: 20,
                  backgroundColor: Colors.amber,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 236, 220, 237),
                      Color(0xFFC385C7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadows: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(10, 10))
                  ],
                  titleText: Lottie.asset(
                    "lot/ro.json",
                    fit: BoxFit.fill,
                  ),
                  duration: Duration(seconds: 5),
                  messageText: Text(
                    "خصص جزء من وقتك اليومي للتعلم وزيادة مهاراتك",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ));
            } else {
              print("----------------------------------------");
            }
            print("----------------------------------------");

            print("THE TEXT IS $text");
          }),
      onListening: (bool isListening) {
        setState(() {
          this.isListening = isListening;
        });
        if (!isListening) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            Utils.scanVoicedText(textSample);
          });
        }
      });
}
