import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'computer_turn.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    animation =
        Tween<double>(begin: 0.0, end: 10.0).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 67, 1),
      body: Center(
        child: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: RiveAnimation.asset(
                "assets/animation/rock_paper_scissor.riv",
                fit: BoxFit.cover,
              ),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Transform(
                transform: Matrix4.translationValues(0, animation.value, 0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ComputerTurn()));
                    },
                    child: Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 40,
                            letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
