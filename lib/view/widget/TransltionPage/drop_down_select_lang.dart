import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ControllerReviwe/Controllerlpha.dart';

class DropDownSelectLang extends GetView<ControllerAlph> {
  const DropDownSelectLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ControllerAlph>(
        builder: (controller) => CustomDropdownButton2(
          buttonDecoration: BoxDecoration(
              color: Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hint: 'Select Item',
          dropdownItems: controller.langitems,
          value: controller.selectedValue,
          onChanged: (value) {
            controller.onchange(value!);
          },
        ),
      ),
    );
  }
}
