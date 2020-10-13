import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/auth-screen.dart';
import 'package:flutterfinaldevproject_x17138744/screens/homearea/home-screen.dart';
import 'package:flutterfinaldevproject_x17138744/screens/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // passing the state of sign in and sign out using the package provider
    // everytime a user logs in they are getting a user object stored in this user value, else it gets null.

    // So simply a condition can then be made to decide this
    final user = Provider.of<UserDeets>(context);

    if (user == null) {
      return AuthUser();
    } else {
      return Home();
    }
  }
}

// ****************Notes*************************

// this widget will either return the home-area folder or the auth-area folder depending on if the user is signed in or not

// This will be the place where the dynamic authentication changed happen

// This will be faciliated in Flutter with a stream to listen to auth changes

// There is a package that helps us to do this - https://pub.dev/packages/provider/install

// the firebase auth service is going to emit something to us whether we sign in or sign out, which can be some kind of user object if we sign in (to then update the UI on that condition), if not it returns null!
