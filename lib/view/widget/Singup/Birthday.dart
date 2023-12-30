import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerAuth/ControllerSingup.dart';

import '../../../Static/StaticInternet/TextFormfidDate.dart';
import '../../../Static/valid.dart';

class Birthday extends GetView<ControllerSingup> {
  const Birthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerSingup>(
      builder: (controller) => Textformfiddate(
        a: TextStyle(fontFamily: "Cairo"),
        mycontroller: controller.birthday,
        valid: (val) {
          return validbirthday(controller.dateTime.toString());
        },
        hint: controller.dateTime == null
            ? "19-8-1998"
            : controller.dateTime.toString().substring(0, 10),
        name: "Birthday",
        icon2: InkWell(
          child: Icon(Icons.calendar_month_sharp),
          onTap: () async {
            await controller.checktime();
            // controller.dateTime = (await showDatePicker(
            //     initialDatePickerMode: DatePickerMode.year,
            //     confirmText: "Save",
            //     cancelText: "Cancel",
            //     builder: (context, child) => Theme(
            //           data: Theme.of(context).copyWith(
            //             colorScheme: ColorScheme.light(
            //               primary: Color(0xff6a448d), // <-- SEE HERE
            //               onPrimary: Colors.white, // <-- SEE HERE
            //               onSurface: Colors.black, // <-- SEE HERE
            //             ),
            //             textButtonTheme: TextButtonThemeData(
            //               style: TextButton.styleFrom(
            //                 // ignore: deprecated_member_use
            //                 primary: Color(0xff6a448d), // button text color
            //               ),
            //             ),
            //           ),
            //           child: child!,
            //         ),
            //     context: context,
            //     initialDate: controller.dateTime,
            //     firstDate: DateTime(1950),
            //     lastDate: DateTime(2100)))!;

            // print(controller.dateTime);
          },
        ),
      ),
    );
  }
}
