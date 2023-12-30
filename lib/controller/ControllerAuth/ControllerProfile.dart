import 'package:get/get.dart';



import '../../newservers/newserves.dart';
import '../../view/screen/Bottomnavg.dart';

class ControllerProfile extends GetxController {
  late String birthday;
  late String email;
  late String gender;
  MyServices myServices = Get.find();
  late String username;

  late DateTime agebirthday = DateTime.parse(birthday);
  late DateTime currentDate;
  String calcage() {
    String age = (currentDate.year - agebirthday.year).toString();
    return age;
  }

  String? r;
  @override
  void onInit() {
    username = myServices.sharedPref.getString("name")!;
    email = myServices.sharedPref.getString("email")!;
    birthday = myServices.sharedPref.getString("birth_date")!;
    gender = myServices.sharedPref.getString("gender")!;
    currentDate = DateTime.now();
    r = calcage();
    print(r);
    myServices.sharedPref.setString("age", r.toString());
    super.onInit();
  }

  Singout() {
    myServices.sharedPref.remove("id");
    myServices.sharedPref.remove("birth_date");
    myServices.sharedPref.remove("name");
    myServices.sharedPref.remove("email");
    myServices.sharedPref.remove("gender");
    myServices.sharedPref.remove("age");
    Get.offAll(() => Bottomnav());
  }
}
