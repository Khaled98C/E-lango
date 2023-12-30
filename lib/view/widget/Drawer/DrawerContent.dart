import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/Static/Colors.dart';
import 'package:project/controller/Changetheme.dart';

import 'package:project/view/screen/Bottomnavg.dart';
import 'package:project/view/screen/Profil.dart';
import 'package:project/view/screen/ReviwePage.dart';

import 'package:project/view/screen/Zoo.dart';
import 'package:project/view/widget/Drawer/ClasslistDrawet.dart';

import '../../../newservers/newserves.dart';
import '../../TestSpeech/SpeechTextFul.dart';
import '../../screen/Aboutus.dart';
import '../../screen/Ghangelang.dart';
import '../../screen/Setting.dart';
import '../../screen/TranslionPage.dart';
import '../../screen/changethemePage.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Container(
      decoration: BoxDecoration(
        color: Colorss.secondcolor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("7".tr,
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ))),
          ),
          SizedBox(
            height: 100,
          ),
          myServices.sharedPref.getString("name") == null
              ? InkWell(
                  child: ClasslistDrawet(title: "9".tr, icon: Icons.person),
                  onTap: () {
                    Get.to(() => Bottomnav(),
                        transition: Transition.circularReveal,
                        duration: Duration(seconds: 1));
                  },
                )
              : myServices.sharedPref.getString("name") != null
                  ? InkWell(
                      child: ClasslistDrawet(
                          title: "10".tr, icon: FontAwesomeIcons.person),
                      onTap: () {
                        Get.to(() => Profil(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 1));
                      },
                    )
                  : Container(),
          InkWell(
            child: ClasslistDrawet(icon: Icons.menu_book_sharp, title: "11".tr),
            onTap: () {
              Get.to(() => ReviwePage(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1));
            },
          ),
          InkWell(
              onTap: () {
                Get.to(() => Zoo(),
                    transition: Transition.circularReveal,
                    duration: Duration(seconds: 1));
              },
              child: ClasslistDrawet(
                  icon: FontAwesomeIcons.horse, title: "12".tr)),
        // InkWell(
        //     child: ClasslistDrawet(title: " الاعدادات", icon: Icons.settings),
        //     onTap: () {
        //       Get.to(() => Setting());
        //     },
        //   ),  
          InkWell(
            child: ClasslistDrawet(title: "13".tr, icon: Icons.help),
            onTap: () {
              Get.to(() => Aboutus());
            },
          ),
          InkWell(
            child: GetBuilder<Changetheme>(
              init: Changetheme(),
              builder: (controller) => ClasslistDrawet(
                  title: "14".tr,
                  icon: controller.isDark ? Icons.dark_mode : Icons.sunny),
            ),
            onTap: () {
              Get.to(() => ChangethemePage(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1));
            },
          ),
          InkWell(
            child: ClasslistDrawet(
                title: "15".tr, icon: Icons.travel_explore_outlined),
            onTap: () {
              Get.to(() => TranslionPage(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1));
            },
          ),
          InkWell(
            child: ClasslistDrawet(title: "16".tr, icon: Icons.language),
            onTap: () {
              Get.to(() => Ghangelang(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1));
            },
          ),
          InkWell(
            child: ClasslistDrawet(
                title: "41".tr, icon: Icons.contactless_rounded),
            onTap: () {
              Get.to(() => SpeechTextful(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1));
            },
          ),
        ],
      ),
    );
  }
}
