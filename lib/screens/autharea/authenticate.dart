import 'package:flutter/material.dart';
import 'package:x17138744_codebase/screens/autharea/register.dart';
import 'package:x17138744_codebase/screens/autharea/signin.dart';

class AuthUser extends StatefulWidget {
  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  bool showSignIn = true;

  // pass down this function to toggle
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn; // get the reverse of what it currently is
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInUser(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

// ****************Notes*************************

// This will be the area where there will be a toggle function to decide between either the SignInUser() widget or the Register() widget

// A condition is made to determine and then the toggleView function is passed to SignInUser() and Register() to allow toggle on both screens.
