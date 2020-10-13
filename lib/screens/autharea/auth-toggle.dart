import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/signin-screen.dart';

class AuthUser extends StatefulWidget {
  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignInUser(),
    );
  }
}

// ****************Notes*************************

// This will be the area where there will be a toggle function to decide between either the SignInUser() widget or the Register() widget

// A condition is made to determine and then the toggleView function is passed to SignInUser() and Register() to allow toggle on both screens.
