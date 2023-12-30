import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/Changetheme.dart';

import 'package:project/view/widget/About/Avatar.dart';

import '../../Static/ClassApp.dart';
import '../../Static/Colors.dart';

import '../widget/About/Socialmediadata.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Changetheme con = Get.put(Changetheme());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "17".tr,
          style: ClassApp.appbar.headline2,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(
                "assets/dev.png",
              ),
            ),
            gradient:con.isDark?null: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Colorss.secondcolor.withOpacity(0.7),
                  Colorss.secondcolor.withOpacity(0.9),
                  Colorss.secondcolor,
                ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AvatarAbout(
                      image: "assets/khaled.jpg",
                      text: "Khaled Barakat",
                    ),
                    AvatarAbout(
                      image: "assets/basel.jpg",
                      text: "Basel Althanon",
                    ),
                    AvatarAbout(
                      image: "assets/amen.jpg",
                      text: "Mohammed Hejazi",
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
"18".tr,                 style: 
                    ClassApp.aboutus.headline1
                    
                  ),
                  Socialmediadata(),
                ],
              ),
              Text("19".tr,
                  style:   ClassApp.aboutus.headline1),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("khaled Barakat",
                              style:   ClassApp.aboutus.headline1),
                          subtitle: Text("+963 951 491 351",style: ClassApp.aboutus.headline1),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("Mohammed Hejazi",
                              style:   ClassApp.aboutus.headline1),
                          subtitle: Text("+963 946 160 456",style: ClassApp.aboutus.headline1),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("Basel Althanon",
                              style:   ClassApp.aboutus.headline1),
                          subtitle: Text("+963 935 935 212",style: ClassApp.aboutus.headline1) ,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
