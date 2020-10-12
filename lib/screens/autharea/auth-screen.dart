import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/sign-in.dart';

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
