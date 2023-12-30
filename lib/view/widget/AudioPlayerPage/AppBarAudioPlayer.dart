import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Static/ClassApp.dart';


class AppBarScreenTruePageAudio extends StatelessWidget
    with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  AppBarScreenTruePageAudio({Key? key, required this.title})
    : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back)),
      title: Text(title,style: ClassApp.appbar.headline2,),
      centerTitle: true,
      backgroundColor: Color(0xffc385c7),
      elevation: 0,
    );
  }
}