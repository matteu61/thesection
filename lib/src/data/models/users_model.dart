import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String firstname;
  final String lastname;
  final String email;
  final String priviledges;
  final String uid;

  const Users({
    required this.email,
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.priviledges,
  });

  factory Users.fromJson(Map<dynamic, dynamic> json) => Users(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      priviledges: json['priviledges'] as String,
      uid: json['uid'] as String,
      email: json['email'] as String);

  Map<String, dynamic> toJson() => {
        'lastname': lastname,
        'firstname': firstname,
        'email': email,
      };
  factory Users.fromSnapshot(DocumentSnapshot snapshot) {
    final user = Users.fromJson(snapshot.data() as Map<String, dynamic>);

    return user;
  }

  @override
  List<Object> get props {
    return [
      firstname,
      lastname,
      email,
      priviledges,
      uid,
    ];
  }
}
