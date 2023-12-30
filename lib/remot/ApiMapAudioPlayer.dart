import 'package:project/Static/StaticInternet/Crud.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/link.dart';

class ApiMapAudio {
  Crudnew cr;

  ApiMapAudio(this.cr);
  getdata(String id_category) async {
    var response = await cr.postdata(mapAudioPlayer, {
       'id_category':id_category.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
   
}
