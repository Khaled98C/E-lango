import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/view/widget/Drawer/Drawerkh.dart';

import '../newservers/newserves.dart';

class Flaotingactiongotohome2 extends StatelessWidget {
  const Flaotingactiongotohome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            myServices.sharedPref.setString("skip2", "2");
            Get.off(() => Drawerkh());
          },
          child: Container(
            padding: EdgeInsets.all(7),
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "الذهاب الى الصفحة الرئيسية",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.grey[600],
                  size: 20,
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
