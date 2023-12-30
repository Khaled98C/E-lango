import 'package:project/Static/StaticInternet/Crud.dart';

import '../Static/StaticInternet/link.dart';

class ApiSingup {
  Crudnew cr;
  ApiSingup(this.cr);
  getdataSingup(String username, String password, String gender,
      String birthday, String email) async {
    var response = await cr.postdata(singup, {
      'username': username.toString(),
      'password': password.toString(),
      'gender': gender.toString(),
      'birth_date': birthday.toString(),
      'email': email.toString()
    });

    return response.fold((l) => l, (r) => r);
  }
}
