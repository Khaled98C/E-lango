import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:project/view/widget/Zoo/AnimalDetils.dart';


class FrtwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fr2.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(soundname: "hipponame",
                                    animalname: 'Hippo',
                                    titleEnglish:
                                        'Hippo moms give birth to \n              one baby.',
                                    titlearabic:
                                        "تلد أمهات فرس النهر \n طفلًا واحدًا.",
                                    image: 'hippo',
                                    sound: 'Hippopotamus',
                                    flipen: 'A Hippo makes a wheezing sound.',
                                    flipar: "يُصدر فرس النهر صوت صفير",
                                  )));
                    },
                    child: Container(
                      child: Image(
                          image: AssetImage('assets/hippo.png'), height: 240),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(soundname: "elephantname",
                                    animalname: 'Elephant',
                                    flipar: "الفيل يصدر مثل صوت البوق.",
                                    flipen:
                                        'An elephant makes a trumpet sound.',
                                    image: 'elephant',
                                    sound: 'Elephant',
                                    titleEnglish:
                                        'Elephant moms give birth \n    to only a single child.',
                                    titlearabic:
                                        "تلد أمهات الفيل \n طفل واحد فقط.",
                                  )));
                    },
                    child: Expanded(
                      child: Container(
                          child: Lottie.asset("Lelottie/elephant.json",
                              height: 200)
                          // Image(
                          //     image: AssetImage('assets/elephant.png'),
                          //     height: 220),
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 45),
                  Text(
                    'Hippo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 135),
                  Text(
                    'Elephant',
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 52),
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 27),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimalDetils(soundname: "chameleoname",
                                  animalname:  'Chameleon', titleEnglish:  'Chameleon moms give birth to \n    eight to thirty young ones.',titlearabic: "تلد أمهات الحرباء  \n  من ثمانية إلى ثلاثين صغيرا.", image: "chameleon", sound: "chameleon", flipen:'A Chameleon does not make a sound.', flipar:    "الحرباء لا تصدر أي صوت.")));
                      },
                      child: Container(
                        child: Image(
                            image: AssetImage('assets/chameleon.png'),
                            height: 120),
                      ),
                    ),
                    Text(
                      'Chameleon',
                      style: TextStyle(
                        fontFamily: "Cairo",
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 81),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
