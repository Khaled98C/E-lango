import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerAuth/ControllerLogin.dart';

import '../../../Static/Textformfield.dart';
import '../../../Static/valid.dart';

class User extends GetView<ControllerLogin> {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       Textformfid(
        max: 20,
        mycontroller: controller.username,
        pass: false,
        valid: (val) {
         if (GetUtils.isUsername(val!)) ;
          return validInput(val, 4, 20,"username");
        },
        
        hint: "Username",
        icon2: Icon(
          Icons.person,
        ),
        name: "Username",
        type: TextInputType.text,
      
    );
  }
}
