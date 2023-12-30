import 'package:project/Static/StaticInternet/link.dart';

import '../Static/StaticInternet/Crud.dart';

class Apilogin {
  Crudnew cr;
  Apilogin(this.cr);
  getdata(String username, String password) async {
    var response = await cr.postdata(login, {
      'username': username.toString(),
      'password': password.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }

 
}
