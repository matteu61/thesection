import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thesection/src/data/data_providers/users_data_provider.dart';

class AuthService {
  AuthService();
  late BuildContext context;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get userStatus => _firebaseAuth.authStateChanges();

  Future<String?> signUp({
    required BuildContext context,
    required String email,
    required String password,
    lastname,
    firstname,
  }) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      UsersDao(userID: user?.uid).addUserData(
          lastname: lastname,
          firstname: firstname,
          email: email,
          uid: user?.uid.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'registration succesful',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "SignikaRegular"),
        ),
        backgroundColor: Colors.lightGreen,
        duration: Duration(seconds: 3),
      ));
      return 'Success';
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Registration failed',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "SignikaRegular"),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
      return 'failed to sign up new user: ${e.message}';
    }
  }

  Future<String?> login(
      {required String email,
      required BuildContext context,
      required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'login succesful',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "SignikaRegular"),
        ),
        backgroundColor: Colors.lightGreen,
        duration: Duration(seconds: 3),
      ));

      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Error loging in!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "SignikaRegular"),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
      return e.message;
    }
  }

  Future<String?> logout() async {
    try {
      await _firebaseAuth.signOut();
      return 'Signed out!';
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Error Signing out!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "SignikaRegular"),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
      return 'Error Signing out: ${e.message}';
    }
  }
}
