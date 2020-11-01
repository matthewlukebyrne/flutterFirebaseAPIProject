import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutterfinaldevproject_x17138744/main.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var animatedSplashScreen = AnimatedSplashScreen(
      splash: Image.asset(
        'assets/splash_screen.png',
      ),
      centered: true,
      duration: 5000,
      backgroundColor: Colors.black,
      splashIconSize: 750.0,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      nextScreen: MyApp(), // Back to MyApp!
    );
    return MaterialApp(home: animatedSplashScreen);
  }
}
