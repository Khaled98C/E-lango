import 'package:get/get.dart';
import 'package:project/remot/ApiDMaprag.dart';

import 'package:project/view/widget/puzzle/Puzzle.dart';
import 'package:project/view/widget/puzzle/Puzzle10.dart';
import 'package:project/view/widget/puzzle/Puzzle6.dart';
import 'package:project/view/widget/puzzle/Puzzle7.dart';
import 'package:project/view/widget/puzzle/Test2.dart';
import 'package:project/view/widget/puzzle/Test3.dart';
import 'package:project/view/widget/puzzle/Test4.dart';
import 'package:project/view/widget/puzzle/puzzle5.dart';

import '../../Static/StaticInternet/Statusrequest.dart';
import '../../Static/StaticInternet/handlingdata.dart';
import '../../view/widget/puzzle/Puzzle8.dart';
import '../../view/widget/puzzle/Puzzle9.dart';

class ControllerMapDrag extends GetxController {
  ApiMapDrag api = ApiMapDrag(Get.find());
  String? id_category;
  late StatusRequest statusRequest;


   GotoLevelGame(String index) {
   // Get.to(() => Test(), arguments: {"id_level": index});
   }

  List mapcatgory = [];
  getdata(String id_category) async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_category);
    print("api in controller___MAP is ${response}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        mapcatgory.addAll(response['map']);
      } else {
        StatusRequest.Nodata;
      }
    }
    update();
  }

 
  @override
  void onInit() {
    id_category = Get.arguments['id_category'];
    getdata(id_category!);

    super.onInit();
  }

  gotoGame(var index) {
    switch (index) {
      case '1':
        {
          Get.to(() => Test(), arguments: {"id_category": index});
        }
        break;

      case '2':
        {
          Get.to(() => Test2(), arguments: {"id_category": index});
        }
        break;

      case '3':
        {
          Get.to(() => Test3(), arguments: {"id_category": index});
        }
        break;
      case '4':
        {
          Get.to(() => Test4(), arguments: {"id_category": index});
          break;
        }
      case '5':
        {
          Get.to(() => Te(), arguments: {"id_category": index});
        }
        break;
      case '6':
        {
          Get.to(() => Puzzle6(), arguments: {"id_category": index});
          break;
        }
      case '7':
        {
          Get.to(() => Puzzle7(), arguments: {"id_category": index});
        }
        break;
      case '8':
        {
          Get.to(() => Puzzle8(), arguments: {"id_category": index});
        }
        break;
      case '9':
        {
          Get.to(() => Puzzle9(), arguments: {"id_category": index});
        }
        break;
      case '10':
        {
          Get.to(() => Puzzle10(), arguments: {"id_category": index});
        }
    }
  }
}
