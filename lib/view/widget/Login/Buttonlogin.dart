import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerAuth/ControllerLogin.dart';
import 'package:spring_button/spring_button.dart';

import '../../../Static/row.dart';

class Buttonlogin extends GetView<ControllerLogin>{
const Buttonlogin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){   
    Timer? timer;

    return   Container(
                      height: 80,
                      width: 400,
                      child: SpringButton(
                        SpringButtonType.OnlyScale,
                        row(
                          "45".tr,
                          Color(0xffa53ff9),
                        ),
                        onTapDown: (_) {
                          controller.getdatalogin();
                        },
                        onLongPress: () => timer = Timer.periodic(
                          const Duration(milliseconds: 1),
                          (_) => (_) {},
                        ),
                        onLongPressEnd: (_) {
                          timer?.cancel();
                        },
                      ),
                    );
  }
}