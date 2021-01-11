import 'package:easy_localization/src/easy_localization_app.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:x17138744_codebase/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen(EasyLocalization newMethod);

  @override
  Widget build(BuildContext context) {
    var animatedSplashScreen = AnimatedSplashScreen(
      splash: Image.asset(
        'assets/swish_logo.png',
      ),
      centered: true,
      duration: 5000,
      splashIconSize: 200.0,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      nextScreen: localizationInit(), // Back to MyApp after localization hits!
    );
    return MaterialApp(home: animatedSplashScreen);
  }
}
