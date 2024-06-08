import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'win.dart';
import 'lose.dart';
import 'draw.dart';

class MyTurn extends StatefulWidget {
  const MyTurn({super.key});

  @override
  State<MyTurn> createState() => _MyTurnState();
}

class _MyTurnState extends State<MyTurn> {
  final List imagelist = [
    "assets/images/rock.png",
    "assets/images/paper.png",
    "assets/images/scissor.png",
  ];

  final List imagename = [
    'Rock',
    'Paper',
    'Scissor',
  ];

  final Map map = {
    0: 'rock',
    1: 'paper',
    2: 'scissor',
  };

  int myChoice = -1;

  int computerChoice = -1;

  String myResult = " ";
  String computerResult = " ";

  bool isEnable = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      computerChoice = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Now this is your turn",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 35,
                  fontFamily: 'Schyler',
                  letterSpacing: 5,
                  wordSpacing: 10,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Image.asset(
                        imagelist[index],
                        height: 70,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(imagename[index]),
                        ],
                      ),
                      subtitleTextStyle: const TextStyle(color: Colors.white),
                      selected: myChoice == index,
                      tileColor: Colors.grey.shade600,
                      selectedTileColor: Colors.redAccent,
                      selectedColor: Colors.white,
                      enabled: isEnable,
                      onTap: () {
                        setState(() {
                          myChoice = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (myChoice == -1) {
                      Fluttertoast.showToast(
                        msg: "You have to choose rock or paper or scissor",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.redAccent,
                      );
                    } else {
                      setState(() {
                        isEnable = false;
                      });

                      if (myChoice == computerChoice) {
                        setState(() {
                          myResult = "You choosed ${map[myChoice]}.";
                          computerResult =
                              "Computer choosed ${map[computerChoice]}.";
                        });
                        Timer(
                          const Duration(seconds: 2),
                          () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Draw(),
                              ),
                            );
                          },
                        );
                      } else if ((myChoice == 0 && computerChoice == 2) ||
                          (myChoice == 1 && computerChoice == 0) ||
                          (myChoice == 2 && computerChoice == 1)) {
                        // You Win
                        setState(() {
                          myResult = "You choosed ${map[myChoice]}.";
                          computerResult =
                              "Computer choosed ${map[computerChoice]}.";
                        });
                        Timer(
                          const Duration(seconds: 2),
                          () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Win(),
                              ),
                            );
                          },
                        );
                      } else {
                        // You Loss
                        setState(() {
                          myResult = "You choosed ${map[myChoice]}.";
                          computerResult =
                              "Computer choosed ${map[computerChoice]}.";
                        });
                        Timer(
                          const Duration(seconds: 2),
                          () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Lose(),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Ok",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Text(
                "$myResult\n$computerResult",
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 20,
                  fontFamily: 'Schyler',
                  letterSpacing: 5,
                  wordSpacing: 10,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
