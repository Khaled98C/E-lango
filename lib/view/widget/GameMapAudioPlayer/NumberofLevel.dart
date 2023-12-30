import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/controller/ControllerMultiChoisi/ControllermapPageAudioPlayer.dart';
import 'package:project/view/screen/PageAudioPlayer.dart';

class NumberofLevelAudioPlayer extends StatelessWidget {
  NumberofLevelAudioPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllermapofLevelAudioPlayer controller = Get.find();
    return GetBuilder<ControllermapofLevelAudioPlayer>(
      builder: (controller) => Container(
        height: 500,
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 10),
          borderRadius: BorderRadius.circular(50),
          color: Color(0xfff7e2a9),
        ),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.mapcatgory.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    controller.GotoLevelGame((index + 11).toString());
                    print((index+11).toString());
                  },
                  child: Hero(
                      tag: index,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            Container(
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
                                child: Text("${index + 1}",
                                    style: GoogleFonts.lobster(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 25,
                                            color: Colors.white)))),
                            //!النجوم Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(
                            //       Icons.star_rounded,
                            //       size: 30,
                            //       color: index.isEven
                            //           ? Colors.yellow
                            //           : Colors.black,
                            //     ),
                            //     Icon(Icons.star_rounded, size: 30),
                            //     Icon(Icons.star_rounded, size: 30),
                            //   ],
                            // )
                          ],
                        ),
                      )));
            }),
      ),
    );
  }
}
