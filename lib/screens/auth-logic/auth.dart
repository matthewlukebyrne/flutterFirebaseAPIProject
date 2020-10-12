import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create a new instance of the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonmously with a try catch in event of error
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // reigister with email and password

  // sign out

}

// ****************Notes*************************

// this widget will use a async feature in flutter called a "Future" which is very similar to a Promise in JavaScript

// https://api.flutter.dev/flutter/dart-async/Future-class.html
