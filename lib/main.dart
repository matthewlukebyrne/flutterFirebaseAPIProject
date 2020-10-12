import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
      home: Wrapper(),
    );
  }
}

// Updated fix with FirebaseCore add (needs research)
// Error - No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
