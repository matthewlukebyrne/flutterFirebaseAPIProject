import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/auth-logic/firebase-auth.dart';

class SignInUser extends StatefulWidget {
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  // get a instance for the sign in from the auth.dart
  final AuthService _auth = AuthService();

  // text field state to keep track of the values to interact with Firebase
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign Into The App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.app_registration),
            label: Text('Register'),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: 'Enter Username'),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search), hintText: 'Enter Password'),
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true, // hide password field
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(email);
                    print(password);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ****************Notes*************************

// the onPressed propety here is important. we get a instance of the AuthService Class and then inside onPressed we AWAIT the signInAnon() function that either returns a user or returns us null

// result returns a object (UID, displayName, email) along with other properties from Firebase. This is now updated to our our very own UserDeets class which returns a UID. We can include more in this if we wanted to.

// ****************Notes*************************

// The SignIn Area widget information is here. More deets to be added.
