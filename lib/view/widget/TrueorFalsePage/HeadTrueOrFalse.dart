import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/Model/TrueOrFalseModel.dart';
import 'package:project/controller/ControllerTrueOrfalse/ControllerTrueOrfalsedata.dart';

class HeadTrueOrFalse extends GetView<ControllerTrueOrFalseData> {
  HeadTrueOrFalse({Key? key, required this.model}) : super(key: key);
  final ModelTrueOrFalse model;
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
                  GetBuilder<ControllerTrueOrFalseData>(builder: (controller) {
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
                    "${model.question}",
                    //  textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      "36".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,fontFamily: "Cairo",
                            fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.translate,
                          size: 20,
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
                                        "${model.translation}",
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
                          print(model.translation);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
