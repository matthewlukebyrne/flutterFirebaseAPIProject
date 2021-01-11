import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x17138744_codebase/models/data.dart';
import 'package:x17138744_codebase/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    // Try to access the data from the stream
    final users = Provider.of<List<Data>>(context) ??
        []; // was throwing null so have empty array on load!

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(data: users[index]);
      },
    );
  }
}
