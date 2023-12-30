

import 'package:project/Static/StaticInternet/Crud.dart';
import 'package:project/Static/StaticInternet/link.dart';

class ApiMap {
  Crudnew cr;
  ApiMap(this.cr);
  getdata(String id_category) async {
    var response = await cr.postdata(map , {
       'id_category':id_category.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
