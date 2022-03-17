import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final List<Map<String, dynamic>> order;
  final Map<String, dynamic> clientDetails;
  final bool paidUp;

  const Orders(
      {required this.order, required this.paidUp, required this.clientDetails});

  factory Orders.fromSnapshot(DocumentSnapshot snapshot) {
    final order = Orders.fromJson(snapshot.data() as Map<String, dynamic>);

    return order;
  }

  Map<String, dynamic> toJson() => {
        'order': order,
        'paid': paidUp,
      };
  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
      order: json['order'],
      paidUp: json['paidUp'],
      clientDetails: json['clientDetails']);

  @override
  List<Object?> get props => [order, paidUp, clientDetails];
}
