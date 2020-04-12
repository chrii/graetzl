import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uuid;

  DatabaseService(this.uuid);

  final CollectionReference collection =
      Firestore.instance.collection('userdata');

  Future updateData(String name, String adress, String email) async {
    return await collection.document(uuid).setData({
      'name': name,
      'adress': adress,
      'email': email,
      'tasks': [],
    });
  }

  // Future<QuerySnapshot> get getUserData async =>
  //     collection.where(uuid).getDocuments();
}
