import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/auth-screen.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/sign-in.dart';
import 'package:flutterfinaldevproject_x17138744/screens/homearea/home-screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this widget will either return the home-area folder or the auth-area folder depending on if the user is signed in or not
    return AuthUser();
  }
}
