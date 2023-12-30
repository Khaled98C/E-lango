import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class on_bording_content extends StatelessWidget {
  const on_bording_content({
    Key? key,
    required this.title,
    required this.body,
    required this.image,
    required this.color,
  }) : super(key: key);
  final String title;
  final String body;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
     
      padding: EdgeInsets.all(70),

      child: Column(
        children: [
          Text(
            title,
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
              child: Lottie.asset(
                image,
                height: 350,
                width: 300,
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Text(body,
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
