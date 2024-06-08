import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:rock_paper_scissors_game/start.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Start()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Stack(
        children: [
          const Center(
            child: RiveAnimation.asset(
              "assets/animation/rock_paper_scissor_splash.riv",
              fit: BoxFit.cover,
              useArtboardSize: true,
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: RiveAnimation.asset(
                      "assets/animation/flame_rivetober.riv"),
                ),
                Text(
                  "Rock Paper Scissor\ngame",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Schyler',
                    letterSpacing: 5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).animate().scaleXY(
            delay: const Duration(seconds: 1),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}
