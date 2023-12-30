
import '../Static/StaticInternet/Crud.dart';
import '../Static/StaticInternet/link.dart';

class ApiQuestion22{
  Crudnew cr;
  ApiQuestion22(this.cr);
  getdata(String idlevel) async {
    var response = await cr.postdata(api2,{
      'id_level':idlevel.toString()
    });

    return response.fold((l) => l, (r) => r);
  

  }
}