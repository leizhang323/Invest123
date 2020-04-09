import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:invest123/app/home/models/user.dart';
import 'package:invest123/services/database_api_path.dart';

abstract class Database {
  Future<void> createUser(DataUser user);
  //void readUser();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final String users = "users";
  Future<void> createUser(DataUser user) async {
    final path = ApiPath.user(uid);
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(user.toMap());
  }

//  Stream<DataUser> readUser() {
//    final path = ApiPath.user(uid);
//    final reference = Firestore.instance.document(path);
//    final snapshot = reference.snapshots();
//    snapshot.map((snapshot) => DataUser(
//      lastname: snapshot.data['lastname'],
//      firstname: snapshot.data['firstname'],
//    ));
//  }
//    void readUser() {
//      final path = ApiPath.users();
//      final reference = Firestore.instance.collection(path);
//      final snapshot = reference.document(uid);
//      snapshot.get() => function(document) {
//        print(document())
//      }
//    }
}