import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:rock_paper_scissors_game/computer_turn.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Stack(
        children: [
          const RiveAnimation.asset(
            "assets/animation/trophy.riv",
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events,
                  color: Colors.orangeAccent,
                  size: 200,
                ).animate().slideY(
                      begin: -10,
                      end: 0,
                      duration: const Duration(seconds: 3),
                      curve: Curves.bounceOut,
                    ),
                const Text(
                  "You Win !!",
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 50,
                    fontFamily: 'Schyler',
                    letterSpacing: 5,
                  ),
                  textAlign: TextAlign.center,
                ).animate().slideY(
                      begin: 10,
                      end: 0,
                      duration: const Duration(seconds: 3),
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
                ).animate().scaleXY(
                      delay: const Duration(seconds: 4),
                      duration: const Duration(seconds: 1),
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
                          Icon(Icons.exit_to_app,
                              size: 30, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ).animate().scaleXY(
                      delay: const Duration(seconds: 4),
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceOut,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
