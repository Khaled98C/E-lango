import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:project/controller/Controllerhome.dart';
import 'package:project/newservers/newserves.dart';

import 'package:project/view/screen/openDrawer.dart';
import 'package:project/view/widget/HandlScreen.dart';
import 'package:project/view/widget/home/backgroungstack.dart';
import 'package:project/view/widget/home/gamecatgory.dart';
import 'package:project/view/widget/home/grid_view_catgory_game.dart';
import 'package:spring_button/spring_button.dart';
import '../widget/home/hello_dear.dart';
import '../widget/home/sub_title.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controllerhome controller = Get.put(Controllerhome());
    MyServices myServices = Get.find();
    return //Directionality(
        // textDirection:myServices.sharedPref.get("lang")!=null&&myServices.sharedPref.get("lang")=="ar"?TextDirection.rtl: TextDirection.ltr,
        Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffc385c7),
          elevation: 0,
          leading: OpenDrawer()),
      body: 
     
     
         Container(
          child: Column(
            children: [
              Backgroungstack(lottie:"lot/new1.json"),
              HelloDear(),
              SubTitle(),
              Gamecatgory(),
              Divider(
                color: Colors.black,
                thickness: 3,
              ),
              GetBuilder<Controllerhome>(
                builder: (controller) {
                  return Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: HandilingdataView(
                      onRefresh: controller.onRefres,
                      statusRequest: controller.statusRequest,
                      widget: GridViewCatgoryGame(),
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
   
    );
  }
}
