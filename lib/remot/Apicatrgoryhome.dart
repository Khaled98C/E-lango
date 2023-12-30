import 'package:project/Static/StaticInternet/Crud.dart';

import '../Static/StaticInternet/link.dart';

class ApiCatgoryHome {
  Crudnew cr;
  ApiCatgoryHome(this.cr);
  getdata() async {
    var response = await cr.postdata(catogryhome, {});

    return response.fold((l) => l, (r) => r);
  

  }
}
