import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:x17138744_codebase/services/auth.dart';
import 'package:x17138744_codebase/shared/constants.dart';
import 'package:x17138744_codebase/shared/spinner.dart';
import 'package:easy_localization/easy_localization.dart';

class Register extends StatefulWidget {
  // Create a function to accept the toggle functionality
  // Accept the named parameter to then be used here in this class
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // A instance of the auth service class
  final AuthService _auth = AuthService();
  // using flutter built in validation features with a form key (validation)
  final _formKey = GlobalKey<FormState>();
  // SpinnerKit
  bool loading = false;

  // text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        // Return spinner then the loading widget class
        ? LoadingSpinner()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Svg('assets/Register.svg'), fit: BoxFit.cover)),
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
                              hintText: 'email'.tr().toString()),
                          validator: (val) =>
                              val.isEmpty ? 'Enter A Valid Email' : null,
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
                              hintText: 'password'.tr().toString()),
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
                            'register'.tr().toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            // validation methods
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.createUserWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'This email was taken!';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(height: 10.0),
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
                        icon: Icon(Icons.person),
                        backgroundColor: Colors.black,
                        label: Text('sign'.tr().toString()),
                        onPressed: () {
                          widget.toggleView();
                        },
                      )
                    ],
                  ),
                )),
          );
  }
}

// ****************Important Notes*************************

// The Register Area widget information is here. More deets to be added.
// Along with the sign_in.dart the localization atrributes for languages is attached here
