import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project/controller/ControllerMultiChoisi/ControllerAudioPlayerdata.dart';

class HeadPageAudio extends GetView<ControllerAudioPlayerData> {
  const HeadPageAudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: -40,
            width: width,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/one.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: width + 30,
            height: 300,left: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/two.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            child: Container(
              width: 420,
              height: 140,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  GetBuilder<ControllerAudioPlayerData>(builder: (controller) {
                    return LinearPercentIndicator(
                      width: Get.width - 40,
                      lineHeight: 25,
                      percent: (controller.i / controller.data.length) > 1
                          ? (controller.i / controller.data.length)
                              .floor()
                              .toDouble()
                          : (controller.i / controller.data.length),
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xFF8BC34A),
                      barRadius: Radius.circular(25),
                      animation: true,
                      curve: Curves.easeIn,
                      animateFromLastPercent: true,
                    );
                  }),
                  Text(
                    "${controller.data[controller.quetionNumber]['question']}",
                    //  textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,fontFamily: "Cairo",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      "36".tr,
                        style: TextStyle(fontFamily: "Cairo",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.translate,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.question,
                              autoHide: Duration(seconds: 5),
                              body: Container(
                                child: Column(
                                  children: [
                                    Text(
                                        //data[que]['tr'],
                                        "${controller.data[controller.quetionNumber]['translation']}",
                                        //  textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontFamily: "Cairo",
                                          fontSize: 20,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ))
                            ..show();
                          print(
                            controller.data[controller.quetionNumber]
                                ['translation'],
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
