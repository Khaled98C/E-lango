import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerReviwe/Controllerlpha.dart';

import '../../../Static/Textformfield.dart';
import '../../../Static/valid.dart';

class InputTranslion extends GetView<ControllerAlph> {
  const InputTranslion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: controller.formstate,
      child: Textformfid(
          hint: "Enter Text Here",
          mycontroller: controller.userinputwordtransliton,
          type: TextInputType.text,
          pass: false,
          valid: (p0) => validInputtransliton(p0!, 2, 500),
          max: 500),
    ));
  }
}
