import 'package:get/get.dart';
import 'package:project/Static/StaticInternet/Crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crudnew());
  }
}
