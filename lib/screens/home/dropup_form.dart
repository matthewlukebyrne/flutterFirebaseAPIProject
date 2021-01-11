import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:x17138744_codebase/models/data.dart';
import 'package:x17138744_codebase/models/user.dart';
import 'package:x17138744_codebase/services/database.dart';
import 'package:x17138744_codebase/shared/constants.dart';
import 'package:x17138744_codebase/shared/spinner.dart';

class DropUpForm extends StatefulWidget {
  @override
  _DropUpFormState createState() => _DropUpFormState();
}

class _DropUpFormState extends State<DropUpForm> {
  // Using a form then we need a global key
  final _formKey = GlobalKey<FormState>();

  final List<String> coffeeShop = [
    "Starbucks",
    "3FE",
    "Insomnia",
    "Hatch",
    "Nero",
    "Coffee2go",
    "Coffeeshops"
  ];

  String _currentName;
  String _currentShop;
  double _currentStarLevel;

  @override
  Widget build(BuildContext context) {
    // We need the provider here to provide the UserData uid
    final user = Provider.of<Users>(context);

    // RETURNS A STREAM BUILDER SPECIFIRS THE TYPE OF DATA BROUGHT DOWN WHICH IS THE USER DATA CLASS
    return StreamBuilder<UserData>(
        // Listening to a stream inside this service class
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Profile Area ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(
                        icon: Icon(Icons.local_drink),
                        hintText: 'Update Your Area ${userData.name}'),
                    validator: (val) =>
                        val.isEmpty ? "Please update your name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  // dropdown for coffeeshops go here
                  DropdownButtonFormField(
                    value: _currentShop ?? userData.coffeeShop,
                    items: coffeeShop.map((shop) {
                      return DropdownMenuItem(
                        value: shop,
                        child: Text('$shop'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentShop = val),
                  ),
                  // star count
                  SizedBox(height: 20.0),
                  Text(
                    'You have ${userData.stars} stamps collected!',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  SizedBox(height: 10.0),
                  RatingBar(
                    rating: userData.stars,
                    icon: Icon(Icons.stars, size: 45, color: Colors.grey),
                    starCount: 10,
                    spacing: 5.0,
                    size: 45,
                    isIndicator: false, // turn on or off star activity
                    allowHalfRating: false,
                    onRatingCallback: (value, notifier) {
                      setState(() {
                        _currentStarLevel = value;
                      });
                    },
                    color: Colors.amber,
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      // form key to check are the new values input!!!
                      if (_formKey.currentState.validate()) {
                        // went into the database, found the ID and updated the values accordingly
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentShop ?? userData.coffeeShop,
                            _currentStarLevel ?? userData.stars);
                      }
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else {
            return LoadingSpinner();
          }
        });
  }
}

// Important Notes here
// ****************************
// take this widget for example that does my dropdown or dropup... at the top it is declared as a stateful widget. its stateful because things can change. the two clases are the default code you have with flutter the base code.

// you have stateful and stateless. easy. a widget that doesnt move and doesnt change anything(stateless) and a widget that does(stateful)

// in the stateful widget i am returning a StreamProvider of the same code screenshot i was talking to you about....<UserData>. It takes in the stream of DatabaseService class which has all the firebase code I showed you. THIS IS HOW IT PASSED THE DATA DOWN!. then inside this, I have a column with some text, and nice stars plugin to show how many stamps I've collected.

// so now. in theory... using the dot syntax... all i have to is go user.name and this will render the name to every unique UID that holds their information. Dynamic data. all you do is pass it down and fill in the blanks.
