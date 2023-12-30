import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../../newservers/newserves.dart';




class ControllerTranslion extends GetxController {
  MyServices myServices = Get.find();
  Locale? initallang;

  void changlang(String codelang) {
    Locale local = Locale(codelang);
    myServices.sharedPref.setString("lang", codelang);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    String? savelang = myServices.sharedPref.getString("lang");
    if (savelang == "ar") {
      initallang = Locale(savelang!);
    } else if (savelang == "en") {
      initallang = Locale(savelang!);
    } else {
      initallang = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
