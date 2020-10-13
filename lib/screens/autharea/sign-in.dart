import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/auth-logic/auth.dart';

class SignInUser extends StatefulWidget {
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  // get a instance for the sign in from the auth.dart
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign In User'),
        backgroundColor: Colors.red,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signInAnon();
              print('User Signed In');
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}

// ****************Notes*************************

// the onPressed propety here is important. we get a instance of the AuthService Class and then inside onPressed we AWAIT the signInAnon() function that either returns a user or returns us null

// result returns a object (UID, displayName, email) along with other properties from Firebase. This is now updated to our our very own UserDeets class which returns a UID. We can include more in this if we wanted to.
