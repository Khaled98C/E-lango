import '../Static/StaticInternet/Crud.dart';
import '../Static/StaticInternet/link.dart';

class ApiMapDrag {
  Crudnew cr;

  ApiMapDrag(this.cr);
  getdata(String id_category) async {
    var response = await cr.postdata(map, {
       'id_category':id_category.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
   
}