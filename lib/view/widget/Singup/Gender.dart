import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ControllerAuth/ControllerSingup.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    ControllerSingup controller = Get.find();
    return Container(
      width: 400,
      height: 60,
      child: CustomDropdownButton2(
        buttonDecoration: BoxDecoration(
            color: Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hint: 'Select Item',
        dropdownItems: controller.genderItems,
        value: controller.selectedValue,
        onChanged: (value) {
          setState(() {
            controller.selectedValue = value.toString();
          });
        },
      ),
    );
  }
}
