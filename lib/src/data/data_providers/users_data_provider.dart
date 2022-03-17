import 'package:cloud_firestore/cloud_firestore.dart';

class UsersDao {
  final String? userID;

  UsersDao({this.userID});

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Future addUserData(
      {required String lastname,
      required String firstname,
      required String email,
      String? uid}) async {
    return await collection.doc(userID).set({
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'uid': uid
    });
  }

  void updateUser(String userID, Map<String, dynamic> userData) async {
    try {
      collection.doc(userID).update(userData);
    } catch (e) {
      throw 'failed update: $e';
    }
  }

  Stream<QuerySnapshot> getUsersStream() {
    return collection.snapshots();
  }
}
