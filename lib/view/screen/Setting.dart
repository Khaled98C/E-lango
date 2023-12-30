import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project/controller/ControllerSetting.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerSetting controller = Get.put(ControllerSetting());
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعدادات'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.cleardata();
                      },
                      icon: Icon(Icons.restart_alt_outlined)),
                  Container(
                    child: Text("حذف البيانات الاساسية"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
 
  }
}
