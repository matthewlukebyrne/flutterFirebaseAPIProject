import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/services/firebase-auth.dart';
import 'package:flutterfinaldevproject_x17138744/shared/constants.dart';
import 'package:flutterfinaldevproject_x17138744/shared/loading.dart';

class SignInUser extends StatefulWidget {
  // Create a function to accept the toggle functionality
  // Accept the named parameter to then be used here
  final Function toggleView;
  SignInUser({this.toggleView});

  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  // get a instance for the sign in from the auth.dart
  final AuthService _auth = AuthService();

  // using flutter built in validation features with a form key
  final _formKey = GlobalKey<FormState>();

  // spinner widget state
  bool loading = false;

  // text local state to keep track of the values to interact with Firebase
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingSpinner() // if true load spinner
        : Scaffold(
            // else show the rest
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Sign Into The App'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.app_registration),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView(); // refer to the widget
                  },
                )
              ],
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey, // associating a global key with our form
                  // create a form widget for validation
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Email'), // constant.dart
                        validator: (val) =>
                            val.isEmpty ? 'Enter a valid email.' : null,
                        onChanged: (val) {
                          setState(() {
                            email =
                                val; // value that represents what is in form field
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Password'), // constant.dart
                        validator: (val) => val.length < 6
                            ? 'Enter Password 6 characters long.'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password =
                                val; // value that represents what is in form field
                          });
                        },
                        obscureText: true, // hide password field (handy)
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true); // widget spinner
                            dynamic result = await _auth
                                .loginWithEmailandPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not Sign In With These Credentials';
                                loading = false; // widget spinner
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      // Error Credentials errors for Firebase
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
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
