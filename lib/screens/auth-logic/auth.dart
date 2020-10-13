import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfinaldevproject_x17138744/screens/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserDeets _userFromFirebaseUser(User user) {
    return user != null ? UserDeets(uid: user.uid) : null;
  }

  Stream<UserDeets> get userStream {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in user anonmously with Firebase
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out user
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// ****************Notes*************************

// creates a new instance of the firebase auth

// creates user object based on FirebaseUser with UID model class UserDeets

// auth change user stream = setting up a stream so that everytime a user signs in and signsout with OUR UID model class UserDeets

// Future = this widget will use a async feature in flutter called a "Future" which is very similar to a Promise in JavaScript

// https://api.flutter.dev/flutter/dart-async/Future-class.html
