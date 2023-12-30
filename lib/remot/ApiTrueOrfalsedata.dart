
import 'package:project/Static/StaticInternet/Crud.dart';
import 'package:project/Static/StaticInternet/link.dart';

class ApiCTrueOrFalsedata {
  Crudnew cr;
  ApiCTrueOrFalsedata(this.cr);
  getdata(String id_level) async {
    var response = await cr.postdata(leveltruefalse,{
      'id_level':id_level.toString(),
    });

    return response.fold((l) => l, (r) => r);
  

  }
}