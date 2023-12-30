import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controller/ControllerReviwe/Controllerlpha.dart';

import '../../../Static/Textformfield.dart';

class ResultTranslion extends GetView<ControllerAlph> {
  const ResultTranslion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getmessage() {
      // ignore: deprecated_member_use
      if (controller.outputwordtransliton.isNull) {
        return "";
      } else {
        return controller.outputwordtransliton.toString();
      }
    }

    return GetBuilder<ControllerAlph>(
      builder: (controller) => controller.loading
          ? Lottie.asset("lot/loading.json", height: 250)
          : Textformfid(
              maxLines: 9,
              type: TextInputType.text,
              pass: false,
              max: 500,
              hint: getmessage(),
              readonly: true,
            ),
    );
  }
}
