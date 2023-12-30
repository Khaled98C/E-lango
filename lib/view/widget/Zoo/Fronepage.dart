import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/widget/Zoo/AnimalDetils.dart';

class FronePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fr1.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 58,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepOrangeAccent,
                      size: 50,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Jungle animals",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.deepOrangeAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetils(soundname: "toucanname",
                              animalname: 'Toucan',
                              titleEnglish:
                                  'Toucan moms lay two \n         to four eggs.',
                              titlearabic:
                                  'تضع أمهات الطوقان بيضتين \n إلى أربع بيضات',
                              image: 'toucan',
                              sound: "Toucan",
                              flipen: 'A Toucan makes a clattering sound.',
                              flipar: 'يصدر الطوقان صوت قعقعة')));
                },
                child: Container(
                    child: Lottie.asset("Lelottie/toucan.json", height: 200)
                    // Image(
                    //     image: AssetImage('assets/toucan.png'), height: 140),
                    ),
              ),
              Text(
                'Toucan',
                style: TextStyle(
                  fontFamily: "Cairo",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetils(soundname: "lionname",
                                animalname: 'Lion',
                                flipar: 'الاسد يصدر صوت زئير',
                                flipen: 'A Lion makes a roaring sound.',
                                image: 'lion',
                                sound: 'lion',
                                titleEnglish:
                                    'Lion moms give birth to one to \n       five cubs in each litter.',
                                titlearabic:
                                    'تلد أمهات الأسد واحدًا إلى \n خمسة أشبال في كل مرة',
                              )));
                },
                child: Container(
                  child: Image(
                    image: AssetImage('assets/lion.png'),
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              Text(
                'Lion',
                style: TextStyle(
                  fontFamily: "Cairo",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalDetils(soundname: "armadilloname",
                                    flipen: 'An Armadillo makes a squeal.',
                                    image: 'armadillo',
                                    sound: 'Armadillo',
                                    titleEnglish:
                                        'Armadillo moms give birth \n    to eight to fifteen pups.',
                                    animalname: 'Armadillo',
                                    titlearabic:
                                        'تلد أمهات أرماديلو \nمن ثمانية إلى خمسة عشر ',
                                    flipar: 'أرماديلو يصدر  صريرًا',
                                  )));
                    },
                    child: Container(
                      child: Image(
                          image: AssetImage('assets/armadillo.png'),
                          height: 118),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 46),
                  Text(
                    'Armadillo',
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 60),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "اسحبه",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.deepOrangeAccent,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.deepOrangeAccent,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
