import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:x17138744_codebase/features/qr_scanner.dart';
import 'package:x17138744_codebase/models/data.dart';
import 'package:x17138744_codebase/screens/home/user_list.dart';
import 'package:x17138744_codebase/services/auth.dart';
import 'package:x17138744_codebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:x17138744_codebase/shared/splash.dart';

class Home extends StatelessWidget {
  // get a instance for the sign out from the auth.dart
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Data>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
            child: Image.asset('assets/swish_logo.png'),
          ),
          // Actions represents a widget list with icons + buttons inside the app bar to signout
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text('Sign Out'),
                  color: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home_bg.png'),
                    fit: BoxFit.cover)),
            child: UserList()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FloatingActionButton.extended(
            highlightElevation: 10.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRViewScanner()));
            },
            icon: Icon(Icons.qr_code),
            label: Text("QR"),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
