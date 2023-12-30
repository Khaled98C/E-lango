import 'package:get/get.dart';

import 'StaticInternet/message.dart';

validInputtransliton(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "$messageInputEmpty   ";
  }
  if (val.trim().length < min) {
    return "$messageInputmin  $min";
  }
}

validInput(String val, int min, int max, String type) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "$messageInputEmpty   ";
  }
  if (val.trim().length < min) {
    return "$messageInputmin  $min";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "هذا ليس اسم مستخدم";
    }
  }
  if (type == "password") {
    if (!GetUtils.isPassport(val)) {
      return "هذه ليست كلمة مرور";
    }
  }
}

validemail(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "لايمكن ان يكون البريد الالكتروني فارغ   ";
  }
  if (val.trim().length < min) {
    return "لا يمكن ان يكون البريد الالكتروني اقل من  $min";
  }

  Pattern pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp regex = new RegExp("$pattern");
  if (!regex.hasMatch(val)) {
    return "[gogo@gmail.com] البريد الالكتروني يجب ان يكون بصيغة ";
  }
}

validbirthday(String val) {
  if (val.trim().isEmpty) {
    return "ادخل التاريخ الصحيح";
  }
}
