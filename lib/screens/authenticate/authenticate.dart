import 'package:flutter/material.dart';
import 'package:x17138744_codebase/screens/authenticate/register.dart';
import 'package:x17138744_codebase/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  // pass down this function to toggle
  void toggleView() {
    setState(() {
      showSignIn =
          !showSignIn; // get the reverse of what it currently is = false
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

// ****************Important Notes*************************

// This will be the area where there will be a toggle function to decide between either the SignIn() widget or the Register() widget

// A condition is made to determine and then the toggleView function is passed to SignIn() and Register() to allow toggle on both screens.
