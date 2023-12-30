import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/view/widget/home/backgroungstack.dart';

import '../../controller/ControllerAuth/ControllerLogin.dart';
import '../widget/Login/Buttonlogin.dart';
import '../widget/Login/User.dart';
import '../widget/Login/password.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    ControllerLogin controller = Get.put(ControllerLogin());
    return Scaffold(
      body: GetBuilder<ControllerLogin>(
        builder: (controller) => SingleChildScrollView(
            
            child: Column(children: [
          Backgroungstack(lottie: "lot/new1.json"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: Form(
                key: controller.formstate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    User(),
                    Password(),
                    Buttonlogin(),
                  ],
                ),
              ),
            ),
          ),
        ])
            //  ],
            ),
      ),
    );
  }
}
