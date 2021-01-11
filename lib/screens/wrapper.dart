import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x17138744_codebase/models/user.dart';
import 'package:x17138744_codebase/screens/authenticate/authenticate.dart';
import 'package:x17138744_codebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the user data from the Provider in main.dart
    // Whenever there is changes then the Proivder will hear these changes
    final user = Provider.of<Users>(context);

    // return either home or auth widget
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
