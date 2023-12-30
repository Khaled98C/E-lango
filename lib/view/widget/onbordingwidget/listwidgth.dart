import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/widget/onbordingwidget/onbordingcontent.dart';

final List<Widget> Aa = [
  on_bording_content(
      title: "Welcom Dear",
      body: "مرحبا بك في تطبيقنا عزيزي ",
      image: "lot/12.json",
      color: Colors.blue),
  on_bording_content(
    title: "Application content",
    body: "هدفنا هو اضافة المتعة والحماس في تعلم اللغة الانكليزية",
    image: "lot/13.json",
    color: Colors.white,
  ),
  on_bording_content(
      color: Colors.orange,
      title: "Application goal",
      body: "نتمنى لك حظا سعيدا",
      image: "lot/ABC.json"),
];

final List listmap = [
Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
     
      padding: EdgeInsets.all(70),

      child: Column(
        children: [
          Text(
            "Welcome\n Dear",
            style: 
               TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 1),
          Expanded(flex: 4,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Lottie.asset(
            "lot/12.json",
                height: 350,
                width: 300,
                repeat: false
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Text("مرحبا بك في تطبيقنا عزيزي ",
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
        ],
      ),
    ),
Container(
      decoration: BoxDecoration(
        color:  Colors.white,
      ),
     
      padding: EdgeInsets.all(70),

      child: Column(
        children: [
          Text(
        "Application content",
            style: 
               TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 1),
          Expanded(flex: 4,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Image.asset("images/baby.png"),
                height: 350,
                width: 300,
                
              ),
            
          ),
          Spacer(),
          Container(
            child: Text("نتمنى لك حظاً سعيداً",
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color:Colors.orange,
      ),
     
      padding: EdgeInsets.all(70),

      child: Column(
        children: [
          Text(
        "Application goal",
            style: GoogleFonts.abel(
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 1),
          Expanded(flex: 4,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Lottie.asset("lot/ABC.json",repeat: false)
            ,
                height: 350,
                width: 300,
                
              
            ),
          ),
          Spacer(),
          Container(
            child: Text("هدفنا هو اضافة المتعة والحماس في تعلم اللغة الانكليزية",
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
        ],
      ),
    ),



];
