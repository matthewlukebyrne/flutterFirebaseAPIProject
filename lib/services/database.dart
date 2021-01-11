import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:x17138744_codebase/models/data.dart';
import 'package:x17138744_codebase/models/user.dart';

// This service is the dedicated area that connects Firebase to send data to Firestore

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future<void> updateUserData(
      String name, String coffeeShop, double stars) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'coffeeShop': coffeeShop,
      'stars': stars,
    });
  }

  // data list from snapshot
  List<Data> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Data(
          name: doc.data()['name'] ?? '',
          coffeeShop: doc.data()['coffeeShop'] ?? 0,
          stars: doc.data()['stars'] ?? '1.0');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'],
        coffeeShop: snapshot.data()['coffeeShop'],
        stars: snapshot.data()['stars']);
  }

  // get data stream
  Stream<List<Data>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream WITH A PARTICULAR DOCUMENT I CAN RENDER ELESEWHERE!
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
