import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ControllerReviweJubs extends GetxController {
  late AudioPlayer play;
  int index = 0;
  @override
  void onInit() {
    super.onInit();

    play = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  previousPage() {
    if (index == 0) {
      return print(" لا استطيع العودة");
    } else {
      index = index - 1;
    }
    update();
  }

  nextpage() {
    if (index == data.length - 1) {
      return "وصلنا للاخير";
    } else {
      index = index + 1;
      update();
    }
  }

  final List data = [ 
{    "audiopath": "artist.mp3",
    "image": "images/artist.gif",
},
   { "audiopath": "attorney.mp3",
    "image": "images/attorney.gif",},
  
  {  "audiopath": "baker.mp3",
    "image": "images/baker.gif",},
{
    "audiopath": "builder.mp3",
    "image": "images/builder.gif",},
  {
    "audiopath": "carpenter.mp3",
    "image": "images/carpenter.gif",},
  
 {   "audiopath": "cashier.mp3",
   "image": "images/cashier.gif",
 },
   { "audiopath": "dancer.mp3",
    "image": "images/dancer.gif",},
 {
    "audiopath": "doctor.mp3",
    "image": "images/doctor.gif",},
 
  {  "audiopath": "driver.mp3",
    "image": "images/driver.gif",},
  
{    "audiopath": "electrician.mp3",
    "image": "images/electrician.gif",
},
   { "audiopath": "engineer.mp3",
    "image": "images/engineer.gif",
},
{
    "audiopath": "farmer.mp3",
    "image": "images/farmer.gif",
},
{
    "audiopath": "firefighter.mp3",
    "image": "images/firefighter.gif",
}
,
    {"audiopath": "judge.mp3",
    "image": "images/judge.gif",
},
  
    {"audiopath": "mechanic.mp3",
    "image": "images/mechanic.gif",
 },

   { "audiopath": "musician.mp3",
    "image": "images/musician.gif",},

 {
    "audiopath": "nurse.mp3",
    "image": "images/nurse.gif",},


   { "audiopath": "pilot.mp3",
    "image": "images/pilot.gif",
},

 {   "audiopath": "policeman.mp3",
   "image": "images/policeman.gif",
},
  {  "audiopath": "reporter.mp3",
    "image": "images/reporter.gif",
  
 },
    {"audiopath": "scientist.mp3",
    "image": "images/scientist.gif",
  },

   { "audiopath": "teacher.mp3",
    "image": "images/teacher.gif",},
  ];
}
