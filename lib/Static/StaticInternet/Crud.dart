import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت

import 'package:dartz/dartz.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';
import 'package:project/Static/StaticInternet/checkinternet.dart';

class Crudnew {
  //data هي القيم الي بدي دخلها
  Future<Either<StatusRequest, Map>> postdata(String url, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } else {
      return Left(StatusRequest.offlinefailure);
    }
  }

 
}
