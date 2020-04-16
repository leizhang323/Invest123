import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:invest123/app/home/models/user.dart';
import 'package:invest123/services/database_api_path.dart';

abstract class Database {
  Future<void> createUser(DataUser user);
  Future<bool> checkExist(String docID);
  Future<bool> updateUser(String docID, DataUser dataUser);
  Future<bool> updateFirstName(String uid, String firstName);
  Future<bool> updateLastName(String uid, String lastName);
  Future<bool> updatePhoneNumber(String uid, String phoneNumber);
  Future<bool> updateEmailAddress(String uid, String emailAddress);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final String users = "users";

  @override
  Future<void> createUser(DataUser user) async {
    final path = ApiPath.user(uid);
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(user.toMap());
  }

  @override
  Future<bool> checkExist(String uid) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (!snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .setData(DataUser().toMap());
    }
    return snapShot.exists;
  }

  @override
  Future<bool> updateUser(String uid, DataUser dataUser) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .updateData(dataUser.toMap());
    }
    return snapShot.exists;
  }

  @override
  Future<bool> updateFirstName(String uid, String firstName) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .updateData({'first_name': firstName});
    }
    return snapShot.exists;
  }

  @override
  Future<bool> updateLastName(String uid, String lastName) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .updateData({'last_name': lastName});
    }
    return snapShot.exists;
  }

  @override
  Future<bool> updatePhoneNumber(String uid, String phoneNumber) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .updateData({'phone_number': phoneNumber});
    }
    return snapShot.exists;
  }

  @override
  Future<bool> updateEmailAddress(String uid, String emailAddress) async {
    final snapShot = await Firestore.instance.document("users/$uid").get();
    if (snapShot.exists) {
      await Firestore.instance
          .document("users/$uid")
          .updateData({'email_address': emailAddress});
    }
    return snapShot.exists;
  }
}
