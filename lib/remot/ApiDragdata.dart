import 'package:project/Static/StaticInternet/Crud.dart';

import '../Static/StaticInternet/link.dart';

class ApiDragdata {
  Crudnew cr;
  ApiDragdata(this.cr);
  getdata(String id_level) async {
    var response = await cr.postdata(dragdata,{
      'id_level':id_level.toString(),
    });

    return response.fold((l) => l, (r) => r);
  

  }
}