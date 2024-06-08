import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rock_paper_scissors_game/computer_turn.dart';

class Loss extends StatefulWidget {
  const Loss({super.key});

  @override
  State<Loss> createState() => _LossState();
}

class _LossState extends State<Loss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You Loss !!",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 50,
                fontFamily: 'Schyler',
                letterSpacing: 5,
              ),
              textAlign: TextAlign.center,
            ).animate().scaleXY(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Better luck next time",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.emoji_emotions,
                  color: Colors.orange,
                ),
              ],
            ).animate().scaleXY(
                  delay: const Duration(seconds: 1),
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ComputerTurn(),
                  ),
                );
              },
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Play Again",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.replay, size: 30, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ).animate().slideY(
                  begin: 10,
                  end: 0,
                  delay: const Duration(seconds: 2),
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceOut,
                ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Exit",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.exit_to_app, size: 30, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ).animate().slideY(
                  begin: 10,
                  end: 0,
                  delay: const Duration(seconds: 3),
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceOut,
                ),
          ],
        ),
      ),
    );
  }
}
