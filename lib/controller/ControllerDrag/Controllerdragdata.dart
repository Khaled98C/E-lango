import 'package:get/get.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/remot/ApiDragdata.dart';

import '../../Static/StaticInternet/handlingdata.dart';
import '../../view/widget/puzzle/Puzzle.dart';

class ControllerDragData extends GetxController {
  ApiDragdata api = ApiDragdata(Get.find());
  String? id_level;
  late List data = [];

  late StatusRequest statusRequest;
//!هام
  List data1 = [
    {"id": 133, "solution": "Musician", "question_image": "musician.gif"},
    {"id": 134, "solution": "Footballman", "question_image": "footballman.gif"},
    {"id": 135, "solution": "Driver", "question_image": "driver.gif"},
    {"id": 131, "solution": "Policeman", "question_image": "policeman.gif"},
    {"id": 132, "solution": "Mechanic", "question_image": "mechanic.gif"},
  ];
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await api.getdata(id_level.toString());
    print("api in controller_level_data is ${response}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['level']);
        data.shuffle();
      } else {
        StatusRequest.Nodata;
      }
    }
    update();
  }

 

 

  @override
  void onInit() {
    super.onInit();
    id_level = Get.arguments['id_level'];
    getdata();
 
  }
}
