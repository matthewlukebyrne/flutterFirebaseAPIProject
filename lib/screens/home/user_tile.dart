import 'package:flutter/material.dart';
import 'package:x17138744_codebase/models/data.dart';
import 'package:x17138744_codebase/screens/home/dropup_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTile extends StatelessWidget {
  // We want to declare the final property and pass in the property in the constructor
  final Data data;
  UserTile({this.data});

  @override
  Widget build(BuildContext context) {
    // Render bottom panel when pressed
    void _showDropUpPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: DropUpForm(),
            );
          });
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: ListTile(
            onTap: () => _showDropUpPanel(), // fires the bottom sheet
            leading: IconButton(
                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                icon: FaIcon(FontAwesomeIcons.star),
                color: Colors.amber,
                onPressed: () {}),
            // Inside this card the redering of the dynamic data gets returned
            title: Text(data.coffeeShop),
            subtitle: Text('You have collected ${data.stars.round()} stamps')),
      ),
    );
  }
}
