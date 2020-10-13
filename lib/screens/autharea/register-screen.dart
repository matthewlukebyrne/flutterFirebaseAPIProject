import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/auth-logic/firebase-auth.dart';
import 'package:flutterfinaldevproject_x17138744/screens/autharea/signin-screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Please Register'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.login),
            label: Text('Sign In'),
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
                    'Register',
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

// The Register Area widget information is here. More deets to be added.
