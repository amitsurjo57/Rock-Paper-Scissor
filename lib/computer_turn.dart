import 'dart:async';

import 'package:flutter/material.dart';

import 'package:rive/rive.dart';
import 'my_turn.dart';

class ComputerTurn extends StatefulWidget {
  const ComputerTurn({super.key});

  @override
  State<ComputerTurn> createState() => _ComputerTurnState();
}

class _ComputerTurnState extends State<ComputerTurn> {
  String action = "thinking";
  String complete = " ";

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        setState(() {
          action = "choosing";
        });
      },
    );

    Timer(
      const Duration(seconds: 6),
      () {
        setState(() {
          complete = "Done!!";
        });
      },
    );
    Timer(
      const Duration(seconds: 7),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyTurn()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/robot_thinking.png",
              height: 250,
              width: 250,
            ),
            const Text(
              "Computer is",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 35,
                fontFamily: 'Schyler',
                letterSpacing: 5,
                wordSpacing: 10,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$action...",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 35,
                    fontFamily: 'Schyler',
                    letterSpacing: 5,
                    wordSpacing: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: RiveAnimation.asset(
                    "assets/animation/animated_hand.riv",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              complete,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 35,
                fontFamily: 'Schyler',
                letterSpacing: 5,
                wordSpacing: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
