
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/ControllerMultiChoisi/ControllermapPageAudioPlayer.dart';
import '../../../controller/ControllerTrueOrfalse/ControllermapPageTrueOrFalse.dart';

class ScoreAudioplayer extends GetView<ControllermapofLevelAudioPlayer> {
const ScoreAudioplayer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffa6e24e),
      ),
      child: Row(
        children: [
          Text("Socre : ",textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ))),
          
      
                  
                  Obx(() => 
            Text(
              controller.gettotal().toString(),
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      )),
           ),
                
          
        ],
      ),
    );
  }
}