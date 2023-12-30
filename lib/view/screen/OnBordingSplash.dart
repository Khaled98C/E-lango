import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter/material.dart';

import 'package:project/view/widget/onbordingwidget/floatingaction.dart';
import 'package:project/view/widget/onbordingwidget/listwidgth.dart';

class OnBordingSplash extends StatelessWidget {
  const OnBordingSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectpage = 0;
    LiquidController controller = new LiquidController();

    return Scaffold(
      floatingActionButton: Floatingaction(),
      body: LiquidSwipe.builder(
          initialPage: selectpage,
          enableSideReveal: true,
          waveType: WaveType.liquidReveal,
          slideIconWidget: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 30,
          ),
          itemBuilder: (context, index) {
            return listmap[index];
          },
          itemCount: listmap.length),
    
    );
  }
}
