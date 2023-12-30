import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SocialmediaButton.dart';

class Socialmediadata extends StatelessWidget {
const Socialmediadata({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final Uri _url = Uri.parse('https://www.facebook.com/khaled.barkat.9889/');
    Future<void> _facebook() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    final Uri _urlinstgram = Uri.parse('https://www.instagram.com/khalod__98/');
    Future<void> _instgram() async {
      if (!await launchUrl(_urlinstgram)) {
        throw 'Could not launch $_url';
      }
    }

    final Uri _urlgoogle = Uri.parse('https://myaccount.google.com/personal-info');
    Future<void> _google() async {
      if (!await launchUrl(_urlgoogle)) {
        throw 'Could not launch $_url';
      }
    }
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Socialmedia(
                      color: Colors.blue,
                      icon: Icons.facebook,
                      onPressed: () {
                        _facebook();
                      },
                    ),
                    Socialmedia(
                      color: Colors.pinkAccent,
                      icon: FontAwesomeIcons.instagram,
                      onPressed: () {
                        _instgram();
                      },
                    ),
                    Socialmedia(
                      color: Colors.redAccent,
                      icon: FontAwesomeIcons.google,
                      onPressed: () {
                        _google();
                      },
                    )
                    
                  ],
                ),
              ),
            );
  }
}