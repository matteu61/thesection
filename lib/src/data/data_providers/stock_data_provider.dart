import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/stock_model.dart';

class StockDao {
  String? docID;

  StockDao();

  CollectionReference collection =
      FirebaseFirestore.instance.collection('stock');

//add new stock document
  void addNewStock(
    Map<String, dynamic> map,
  ) async {
    try {
      await collection.doc().set(map).whenComplete(() => print('gottit'));
    } catch (e) {
      print('failed to add product: $e');
    }
  }

//edit stock document
  void updateStock(String? docID, Map<String, dynamic> stockMap,
      BuildContext context) async {
    try {
      await collection.doc(docID).update(stockMap);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('succesfully updated'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      throw 'failed: $e';
    }
  }

//get stock stream
  Future<Future<List<Stock>>> getStockStream() async {
    try {
      Future<List<Stock>> snaplist = collection
          .doc()
          .snapshots()
          .map((event) => Stock.fromSnapshot(event))
          .toList();
      return snaplist;
    } catch (e) {
      throw 'we are fucked over here pertaining the stock stream boss: $e';
    }
  }

  //delete doc
  Future deleteDoc(String docID) async {
    try {
      await collection.doc(docID).delete();
    } catch (e) {
      throw 'delete failed: $e';
    }
  }
}
