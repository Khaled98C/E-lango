import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Review/Animal.dart';
import 'package:project/Review/Flags.dart';
import 'package:project/Review/Jopas.dart';
import 'package:project/Review/numbr.dart';
import 'package:project/Review/pageviewLetters.dart';
import 'package:project/Review/vegetables.dart';

class ControllerPageReviwe extends GetxController {
  List <Widget>reviewPage = [
    PageViewAlpheat(),
    PageViewAlpheat4(),
    PageViewAlpheat6(),
    PageViewAlpheat5(),
    PageViewAlpheat2(),
    PageViewAlpheat7(),
  ];
  List image = [
    "Lelottie/Alphabet.json",
    "Lelottie/cute-tiger.json",
    "Lelottie/flags.json",
    "Lelottie/jopes.json",
    "Lelottie/Num.json",
    "Lelottie/vegetable.json",
  ];
  goToReview(int index) {
    switch (index) {
      case 1:
        {
          Get.to(() => PageViewAlpheat(), arguments: {'id_category': index});
        }
        break;

      case 2:
        {
          Get.to(() => PageViewAlpheat4(), arguments: {"id_category": index});
        }
        break;

      case 3:
        {
          Get.to(() => PageViewAlpheat6(), arguments: {"Catyid": index});
        }
        break;

      case 4:
        {
          Get.to(() =>   PageViewAlpheat5(), arguments: {"Catyid": index});
        }
        break;
case 5:
        {
          Get.to(() =>   PageViewAlpheat2(), arguments: {"Catyid": index});
        }
        break;
        case 6:
        {
          Get.to(() =>   PageViewAlpheat7(), arguments: {"Catyid": index});
        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }
}
