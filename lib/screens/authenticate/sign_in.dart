import 'package:flutter/material.dart';
import 'package:x17138744_codebase/services/auth.dart';
import 'package:x17138744_codebase/shared/constants.dart';
import 'package:x17138744_codebase/shared/spinner.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SignIn extends StatefulWidget {
  // Create a function to accept the toggle functionality
  // Accept the named parameter to then be used here
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // A instance of the auth service class
  final AuthService _auth = AuthService();
  // using flutter built in validation features with a form key (validation)
  final _formKey = GlobalKey<FormState>();
  // SpinnerKit
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        // Return spinner then the loading widget
        ? LoadingSpinner()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Svg('assets/Login.svg'), fit: BoxFit.cover)),
                padding: EdgeInsets.fromLTRB(20.0, 180.0, 20.0, 0.0),
                child: Form(
                  key: _formKey, // associating a global key with our form
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              icon: Icon(
                                Icons.email,
                                color: Colors.teal,
                              ),
                              hintText: 'email'.tr()),
                          validator: (val) =>
                              val.isEmpty ? 'Enter An Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              icon: Icon(
                                Icons.security,
                                color: Colors.teal,
                              ),
                              hintText: 'password'.tr()),
                          validator: (val) => val.length < 6
                              ? 'Enter A Valid Password 6+ Chars Long'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.teal,
                          child: Text(
                            'sign'.tr().toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailandPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign in with these credentials.';
                                  loading = false; // spinner off
                                });
                              }
                            }
                          }),
                      SizedBox(height: 10.0),
                      // Error Validation
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton.icon(
                            icon: Icon(Icons.language),
                            label: Text('EN'),
                            onPressed: () {
                              // Set lang to eng
                              setState(() {
                                EasyLocalization.of(context).locale =
                                    Locale('en', 'EN');
                              });
                            },
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.language),
                            label: Text('DE'),
                            onPressed: () {
                              // Set lang to eng
                              setState(() {
                                EasyLocalization.of(context).locale =
                                    Locale('de', 'DE');
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 100.0),
                      FloatingActionButton.extended(
                        icon: Icon(Icons.app_registration),
                        backgroundColor: Colors.black,
                        label: Text('register'.tr().toString()),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                    ],
                  ),
                )),
          );
  }
}

// ****************Notes*************************

// the onPressed propety here is important. we get a instance of the AuthService Class and then inside onPressed we AWAIT the signInAnon() function that either returns a user or returns us null

// result returns a object (UID, displayName, email) along with other properties from Firebase. This is now updated to our our very own User class which returns a UID. We can include more in this if we wanted to.

// ****************Notes*************************

// Along with the sign_in.dart the localization atrributes for languages is attached here
