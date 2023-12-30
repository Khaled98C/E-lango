import 'package:project/Static/StaticInternet/Crud.dart';
import 'package:project/Static/StaticInternet/link.dart';

class ApiCAudioPlayerdata {
  Crudnew cr;
  ApiCAudioPlayerdata (this.cr);
  getdata(String id_level ) async {
    var response = await cr.postdata(levelAudioPlayer,{
      'id_level':id_level.toString(),
      
    });

    return response.fold((l) => l, (r) => r);
  

  }
}