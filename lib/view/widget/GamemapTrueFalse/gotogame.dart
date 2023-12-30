import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/ControllerTrueOrfalse/ControllermapPageTrueOrFalse.dart';
import '../../../model/truefalsemodel.dart';

class Gotogame extends GetView<MapPageTrueOrFalseController> {
  final Classtruemodel model;
  const Gotogame({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
          InkWell(
            onTap: () {
              controller.GotoLevelGame(model.id.toString());
            },
            child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  color: Color(0xffa6e24e),
                  boxShadow: [BoxShadow(color: Colors.grey)],
                ),
                alignment: Alignment.center,
                child: Text("${model.id}",
                    style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            color: Colors.white)))),
         
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.star_rounded,
            //   size: 30,
            //   color:myServices.sharedPref.getString("totalscore") !="0"?Colors.yellow:Colors.black
            // ),
            // Icon(Icons.star_rounded, size: 30),
            // Icon(Icons.star_rounded, size: 30),
          ],
        )
      ],
    );
  }
}
