import 'package:get/get.dart';

import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/handlingdata.dart';
import 'package:project/remot/Apicatrgoryhome.dart';
import 'package:project/view/screen/MapDrag.dart';
import 'package:project/view/screen/MapGameAudioplayer.dart';
import 'package:project/view/screen/MapGameTrueFalse.dart';
import 'package:project/view/screen/ReviwePage.dart';

import '../newservers/newserves.dart';
import '../view/screen/Mapquestion.dart';

class Controllerhome extends GetxController {
  MyServices myServices = Get.find();
  gotoreviwe() {
    Get.to(() => ReviwePage());
  }

  Future<void> onRefres() async {
    getdata();
    return await Future.delayed(Duration(milliseconds: 100));
  }

  late String username;
  MyServices myservies = Get.find();

  gotomap(var index) {
    switch (index) {
      case '1':
        {
          Get.to(() => MapGameTrueFalse(), arguments: {'id_category': index});
        }
        break;

      case '2':
        {
          Get.to(() => MapGameAudioPlayer(), arguments: {"id_category": index});
        }
        break;

      case '3':
        {
          Get.to(() => MapDrag(), arguments: {"id_category": index});
        }
        break;
      case '4':
        {
          Get.to(() => Mapquetsion(), arguments: {"id_category": index});
        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  late List catgory = [];

  ApiCatgoryHome connectapi = ApiCatgoryHome(Get.find());
  late StatusRequest statusRequest;

  @override
  void onInit() {
    getdata();

    super.onInit();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    catgory.clear();
    var response = await connectapi.getdata();
    print("api in controller is ${response}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        catgory.addAll(response['Category']);
      } else {
        StatusRequest.Nodata;
      }
    }
    update();
  }
}
