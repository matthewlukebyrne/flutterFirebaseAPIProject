import 'package:cloud_firestore/cloud_firestore.dart';

// This service is the dedicated area that connects Firebase to send data to Firestore

class DatabaseService {
  // Creates a brand new collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('collection');
}
