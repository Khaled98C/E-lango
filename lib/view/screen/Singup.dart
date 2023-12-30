import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Static/Textformfield.dart';
import 'package:intl/intl.dart';
import 'package:project/Static/valid.dart';
import 'package:project/view/widget/home/backgroungstack.dart';
import '../../Static/StaticInternet/TextFormfidDate.dart';
import '../../controller/ControllerAuth/ControllerSingup.dart';
import '../widget/Singup/Birthday.dart';
import '../widget/Singup/ButtonSingup.dart';
import '../widget/Singup/Gender.dart';
import '../widget/Singup/Password.dart';
import '../widget/Singup/Username.dart';
import '../widget/Singup/emailSingup.dart';

class Singup extends StatefulWidget {
  Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
  
    ControllerSingup controller = Get.put(ControllerSingup(context: context));
    return Scaffold(
        body: GetBuilder<ControllerSingup>(
      builder: (controller) => ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Backgroungstack(lottie: "lot/new2.json"),

          Form(
            key: controller.formstate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // key: controller2.formstate,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserNameSingup(),
                  PasswordSingup(),
                  EmailSingup(),
                  Birthday(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Gender(),
                  ),
                  ButtonSingup(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
