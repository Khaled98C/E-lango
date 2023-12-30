import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/view/widget/puzzle/Puzzle.dart';

class Test3 extends StatefulWidget {
  const Test3({ Key? key }) : super(key: key);

  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  @override void initState() {
    super.initState();
   

    initGame();
  }late List<ItemModel> items;
  late List<ItemModel> items2;
  int index = 0;
  late double score;
  late bool gameOver;
   List data = [
    {
        "solution": "Elephant",
      "question_image": "elephant.gif"
    },
    {
    "solution": "Fish",
      "question_image": "fish.gif"
    },
    {
    
   "solution": "Fox",
      "question_image": "fox.gif"
     
    },
    {
      
     "solution": "Horse",
      "question_image": "horse.gif"
    },
    {
      
    "solution": "Dolphin",
      "question_image": "dolphin.gif"
     
    }
  ];
  initGame() {
    gameOver = false;
    score = 0;
    items = [
      // ignore: deprecated_member_use
      ItemModel(
          icon: data[0]['question_image'],
          name: data[0]["solution"],
          value: data[0]["solution"]),
      ItemModel(
          icon: data[1]['question_image'],
          name: data[1]["solution"],
          value: data[1]["solution"]),
      ItemModel(
          icon: data[2]['question_image'],
          name: data[2]["solution"],
          value: data[2]["solution"]),
      // ignore: deprecated_member_use
      ItemModel(
          icon: data[3]['question_image'],
          name: data[3]["solution"],
          value: data[3]["solution"]),
      ItemModel(
          icon: data[4]['question_image'],
          name: data[4]["solution"],
          value: data[4]["solution"]),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }
  Widget build(BuildContext context) {final width = Get.width;
    if (items.length == 0) gameOver = true;
    return Scaffold(
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(right: 150),
      //   child: FloatingActionButton(
      //     backgroundColor: Color(0xffc385c7),
      //     child: Icon(Icons.refresh),
      //     onPressed: () {
      //       setState(() {
      //         initGame();
      //       });
      //     },
      //   ),
      // ),
      // ignore: deprecated_member_use
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.refresh),
            onPressed: () {
              setState(() {
                initGame();
              });
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Color(0xffc385c7),
        elevation: 0,
        title: Text('انقل الشكل الى اسمه الصحيح'),
      ),
      body: 
          
          Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("images/ggg.png"),
              //         alignment: Alignment.bottomRight)),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -40,
                          width: width,
                          height: 300,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/one.png"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Positioned(
                          width: width + 30,
                          height: 300,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/two.png"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: 420,
                            height: 140,
                            padding: EdgeInsets.all(10),
                            child: LinearPercentIndicator(
                              width: Get.width - 40,
                              lineHeight: 25,
                              percent: (score / data.length) > 1
                                  ? (score / data.length)
                                      .floor()
                                      .toDouble()
                                  : (score / data.length),
                              backgroundColor: Colors.grey,
                              progressColor: Color(0xFF8BC34A),
                              barRadius: Radius.circular(25),
                              animation: true,
                              curve: Curves.easeIn,
                              animateFromLastPercent: true,
                            ),
                          ),
                        ),
                        Center(
                          child: Lottie.asset('Lelottie/move.json',
                              repeat: false, height: 300, width: 200),
                        )
                      ],
                    ),
                  ),
                  if (!gameOver)
                    Row(
                      children: <Widget>[
                        Column(
                            children: items.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: 100,
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Draggable<ItemModel>(
                                data: item,
                                childWhenDragging: Image.asset(
                                  "images/${item.icon}",
                                ),
                                feedback: Image.asset(
                                  "images/${item.icon}",
                                  height: 100,
                                  width: 100,
                                ),
                                child: Image.asset(
                                  "images/${item.icon}",
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                        Spacer(),
                        Column(
                            children: items2.map((item) {
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              if (item.value == receivedItem.value) {
                                setState(() {
                                  items.remove(receivedItem);
                                  items2.remove(item);
                                  score++;
                            //      _controllerCenter.play();
                                  item.accepting = false;
                                });
                              } else {
                                setState(() {
                                  item.accepting = false;
                                });
                              }
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                            //    _controllerCenter.play();
                              });
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            builder: (context, acceptedItems, rejectedItem) =>
                                Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: item.accepting
                                    ? Color(0xFF8BC34A)
                                    : Color(0xff3e2b64).withOpacity(0.8),
                              ),
                              height: 70,
                              width: 130,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8.0),
                              child: Text(
                                item.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          );
                        }).toList()),
                      ],
                    ),
                  if (gameOver) Lottie.asset("Lelottie/winner.json"),
                  if (gameOver)
                    Center(
                      child: Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: InkWell(
                          child: Text(
                            "PlayAgian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              initGame();
                            });
                          },
                        ),
                      ),
                    )
                ],
              ),
          )
      
    );
  }
}