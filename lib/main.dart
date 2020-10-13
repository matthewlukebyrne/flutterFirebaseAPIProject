import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/auth-logic/firebase-auth.dart';
import 'package:flutterfinaldevproject_x17138744/screens/models/user.dart';
import 'package:flutterfinaldevproject_x17138744/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// The main function that runs the main method which fires MyApp()
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserDeets>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

// ****************Notes*************************

// Updated fix with FirebaseCore add (needs research)
// Error - No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()

// The materialApp is then wrapped with a StreamProvider.value and inside this is what stream we want to listen to (userStream) which is inside the auth.dart file.
