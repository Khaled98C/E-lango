import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:project/view/widget/Drawer/Drawerkh.dart';

import '../../../controller/ControllerTestQuetsion.dart';
import '../../../newservers/newserves.dart';
import '../../screen/TestQuetsion.dart';



class Floatingaction extends StatelessWidget {
  const Floatingaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myservis = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            myservis.sharedPref.setString("skip", "1");
           // Get.off(() => Drawerkh());
Get.off(() =>TestQuetsionScreen());

          },
          child: Container(
            padding: EdgeInsets.all(7),
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(textAlign: TextAlign.center,
                    "تخطي",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
