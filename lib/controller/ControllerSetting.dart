import 'package:get/get.dart';

import '../newservers/newserves.dart';

class ControllerSetting extends GetxController {
  MyServices myServices = Get.find();
  cleardata() {
    myServices.sharedPref.clear();
    // myServices.sharedPref.remove("skip");
    // myServices.sharedPref.remove("skip2");
    // myServices.sharedPref.clear();
  }

  clearScoreTrue() {
    myServices.sharedPref.remove("totalscore");
  }
}
