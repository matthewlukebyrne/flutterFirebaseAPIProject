import 'package:flutter/material.dart';
import 'package:x17138744_codebase/screens/services/firebase-auth.dart';
import 'package:x17138744_codebase/shared/constants.dart';
import 'package:x17138744_codebase/shared/spinner.dart';

class Register extends StatefulWidget {
  // Create a function to accept the toggle functionality
  // Accept the named parameter to then be used here
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // get a instance for the sign in from the auth.dart
  final AuthService _auth = AuthService();

  // using flutter built in validation features with a form key (validation)
  final _formKey = GlobalKey<FormState>();

  // spinner widget state
  bool loading = false;

  // text field state to keep track of the values to interact with Firebase
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingSpinner() // loadingSpinnerTrue
        : Scaffold(
            // Else the rest
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Register Application'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.login),
                  label: Text('Sign In'),
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
                            email = val;
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailandPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not register with These Credentials';
                                  loading = false;
                                });
                              }
                            } // validates the form
                          }),
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

// The Register Area widget information is here. More deets to be added.
