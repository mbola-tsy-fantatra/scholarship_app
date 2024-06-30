import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/people_network.png';
    const logo = 'assets/scholarnet_logo.png';
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: buildImage(logo, 25, BoxFit.none),
            ),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0, left: 32, right: 32),
                  child: ButtonWidget(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget paint(Color color) {
    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 75.0, sigmaY: 95.0),
          child: const SizedBox.shrink()),
    );
  }

  Widget buildImage(String path, double? width, BoxFit? fit) => Image.asset(
        path,
        width: width,
        fit: fit,
      );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56) ,
          maximumSize: const Size(double.infinity, 64),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(fontSize: 18), //
        ),
        child: const Text('Get Started'),
      ),
    );
  }
}
