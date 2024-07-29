import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/people_network.png';
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 15,
            child: Transform.rotate(
              angle: -12,
              child: Container(
                width: 150,
                height: 350,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.deepPurpleAccent),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Transform.rotate(
              angle: -12,
              child: Container(
                width: 85,
                height: 250,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.pinkAccent),
              ),
            ),
          ),
          Positioned.fill(
            child: paint(
              Colors.white.withOpacity(0.2),
              75.0,
              95.0,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 70.0,
              ),
              Center(
                child: SizedBox(
                    child: buildImage(
                        assetName, double.infinity, BoxFit.fitWidth)),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SCHOLARNET',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2.0,
                            fontSize: 24.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Connecting you to Opportunities",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 32.0, left: 32, right: 32),
                child: ButtonWidget(
                  onPressed: () {
                    context.router.pushNamed('/login');
                  },
                  label: 'Get started',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String path, double? width, BoxFit? fit) => Image.asset(
        path,
        width: width,
        fit: fit,
      );
}

Widget paint(Color color, double sigmaX, double sigmaY) {
  return ClipRect(
    child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: 95.0),
        child: const SizedBox.shrink()),
  );
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool enabled;
  final bool isLoading;
  const ButtonWidget({super.key, required this.onPressed, required this.label, this.enabled = true, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? () {
          onPressed();
        }: null,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          maximumSize: const Size(double.infinity, 64),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(fontSize: 18), //
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            isLoading ? const CircularProgressIndicator(): const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
