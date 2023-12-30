import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/widget/Zoo/AnimalDetils.dart';

class FrthreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fr3.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 150),
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(
                                    soundname: "owlname",
                                    animalname: 'Owl',
                                    titleEnglish:
                                        '  Owl moms lay one to \n thirteen eggs at a time.',
                                    titlearabic:
                                        " تضع أمهات البوم بيضة واحدة الى \n ثلاث عشرة بيضة في المرة الواحدة",
                                    image: "owl",
                                    sound: 'owl',
                                    flipar: "البومة تصدر صوت طائر.",
                                    flipen: 'An Owl makes a hooting sound.',
                                  )));
                    },
                    child: Container(
                      child: Lottie.asset("Lelottie/owl.json",
                          height: 160, width: 160),
                      // Image(
                      //     image: AssetImage('assets/owl.png'), height: 120),
                    ),
                  ),
                  Column(
                    children: [
                      Lottie.asset("Lelottie/parrot.json",
                          height: 160, width: 160),
                      Text(
                        "Parrot",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Text(
                    'Owl',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(
                                    soundname: "zebraname",
                                    animalname: 'Zebra',
                                    titleEnglish:
                                        'Zebra moms give birth to \n              one foal.',
                                    titlearabic:
                                        "تلد أمهات الحمار الوحشي \n مهراًُ واحداً",
                                    image: 'zebra',
                                    flipen: 'A Zebra makes a snorting sound.',
                                    flipar: "يصدر الحمار الوحشي صوت ",
                                    sound: 'Zebra',
                                  )));
                    },
                    child: Container(
                      child: Image(
                          image: AssetImage('assets/zebra.png'), height: 240),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(
                                    soundname: "giraffename",
                                    animalname: 'Giraffe',
                                    titleEnglish:
                                        'Giraffe moms give birth to \n              one baby.',
                                    titlearabic:
                                        "تلد أمهات الزرافة \n طفلًا واحدًا",
                                    image: "giraffe",
                                    sound: 'Giraffe',
                                    flipen: 'A Giraffe makes a bleating sound.',
                                    flipar: " الزرافة تصدر صوت همهمة",
                                  )));
                    },
                    child: Container(
                      child: Image(
                          image: AssetImage('assets/giraffe.png'), height: 300),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 80),
                  Text(
                    'Zebra',
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 90),
                  Text(
                    'Giraffe',
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
