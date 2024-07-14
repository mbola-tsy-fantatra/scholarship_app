import 'package:flutter/material.dart';
import 'package:scholariship/features/onboarding_profile/presentation/views/splash_screen.dart';

class TopDesign extends StatelessWidget {
  final double height;

  const TopDesign({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: height * 0.25,
        child: Stack(
          children: [
            Positioned(
              top: 75,
              left: 0,
              child: Transform.rotate(
                angle: -18,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75,
              right: 0,
              child: Transform.rotate(
                angle: -12,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: paint(Colors.white.withOpacity(0.1), 25.0, 10.0),
            ),
          ],
        ),
      ),
    );
  }
}