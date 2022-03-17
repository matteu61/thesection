import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersDao {
  OrdersDao();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('orders');

  Future deleteDoc(String docID) async {
    try {
      await collection.doc(docID).delete();
    } catch (e) {
      throw 'delete failed: $e';
    }
  }

  Future addOrderData(
      {required List<Map<String, dynamic>> order,
      required Map<String, dynamic> clientDetails,
      required bool? paidUp}) async {
    try {
      return await collection.doc().set({
        'order': order,
        'clientDetails': clientDetails,
        'paidUp': paidUp ?? false,
      });
    } catch (e) {
      throw 'upload failed: $e';
    }
  }

  void editUser(
      {required String docID, required Map<String, dynamic> json}) async {
    collection.doc(docID).update(json);
  }

  Stream<QuerySnapshot> getOrdersStream() {
    return collection.snapshots();
  }
}
