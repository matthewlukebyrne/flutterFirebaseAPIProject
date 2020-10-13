import 'package:flutter/material.dart';
import 'package:flutterfinaldevproject_x17138744/screens/auth-logic/firebase-auth.dart';

class Home extends StatelessWidget {
  // get a instance for the sign out from the auth.dart
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('User Signed In'),
        backgroundColor: Colors.red,
        // Actions represents a widget list with icons + buttons inside the app bar
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              print('User Signed Out');
            },
          )
        ],
      ),
    );
  }
}
