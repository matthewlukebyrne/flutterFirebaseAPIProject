import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:x17138744_codebase/main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var animatedSplashScreen = AnimatedSplashScreen(
      splash: Image.asset(
        'assets/swish_logo.png',
      ),
      centered: true,
      duration: 5000,
      splashIconSize: 150.0,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      nextScreen: MyApp(), // Back to MyApp!
    );
    return MaterialApp(home: animatedSplashScreen);
  }
}
