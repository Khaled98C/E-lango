import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Middleware/MidellwareOnporder.dart';

import 'package:project/Static/Theme.dart';

import 'package:project/controller/Changetheme.dart';
import 'package:project/controller/binding.dart';
import 'package:project/view/TestSpeech/SpeechTextFul.dart';
import 'package:project/view/screen/QuetsionPage.dart';
import 'package:project/view/screen/TestQuetsion.dart';

import 'package:project/view/widget/Drawer/Drawerkh.dart';
import 'package:project/view/screen/OnBordingSplash.dart';

import 'Static/StaticTranslion/ControllerTranslion.dart';
import 'Static/StaticTranslion/Translations.dart';
import 'newservers/newserves.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Changetheme co = Get.put(Changetheme(), permanent: true);
    ControllerTranslion controlllerTranslion = Get.put(ControllerTranslion());
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'E-Learning',
      translations: TranslationsLang(),
      locale: controlllerTranslion.initallang,
      theme: co.myServices.sharedPref.getBool("dark") != null
          ? ThemeEdite.dark
          : ThemeEdite.light,

      initialRoute: "/",
      getPages: [
        //  GetPage(name: "/", page: () => QuetsionPage()),

        // GetPage(name: "/", page: ()=> TestQuetsion()),
        //GetPage(name: "/", page: ()=>BeginAlph()),
        GetPage(
          name: "/",
          page: () => OnBordingSplash(),

           middlewares: [OnpordMidelware()]
        ),

        GetPage(name: "/home", page: () => Drawerkh()),
      ],
      //OnBordingSplash(),
    );
  }
}
