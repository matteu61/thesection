import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thesection/src/data/models/sizeblock.dart';

class Stock {
  final String productType;
  late num likes;
  final num salePrice;
  final bool onSale;
  final List<String> images;
  final List<Map<String, dynamic>>? sizeNqty;
  final num costPrice;
  final bool addToHeadline;
  final String name;
  final String header;
  final num restockRequests;
  final String description;
  final String headlineDescription;
  late String docID;
  final num discount;

  Stock(
      {required this.name,
      required this.images,
      required this.salePrice,
      required this.costPrice,
      required this.addToHeadline,
      required this.sizeNqty,
      required this.description,
      required this.productType,
      this.onSale = false,
      this.header = '',
      this.likes = 0,
      this.discount = 0,
      this.restockRequests = 0,
      required this.headlineDescription});

  factory Stock.fromJson(Map<dynamic, dynamic> json) => Stock(
        salePrice: json['salePrice'] as num,
        costPrice: json['costPrice'] as num,
        onSale: json['onSale'] as bool,
        discount: json['discount'] as num,
        addToHeadline: json['addToHilight'] as bool,
        images: json['images'] as List<String>,
        sizeNqty: json['sizeNqty'],
        productType: json['productType'] as String,
        likes: json['likes'] as num,
        restockRequests: json['restockrequests'] as num,
        description: json['description'] as String,
        name: json['name'] as String,
        headlineDescription: json['headlineDescription'],
      );

  Map<String, dynamic> toJson() => {
        'productType': productType,
        'discount': discount,
        'onSale': onSale,
        'name': name,
        'salePrice': salePrice,
        'costPrice': costPrice,
        'restockRequests': restockRequests,
        'description': description,
        'headlineDescription': headlineDescription,
        'images': images,
        'addToHilight': addToHeadline,
        'sizeNqty': sizeNqty
      };
  factory Stock.fromSnapshot(DocumentSnapshot snapshot) {
    Stock stockDocument =
        Stock.fromJson(snapshot.data() as Map<String, dynamic>);
    stockDocument.docID = snapshot.reference.id;
    return stockDocument;
  }

  Stock copyWith({
    String? productType,
    num? likes,
    num? salePrice,
    List<String>? images,
    List<Map<String, dynamic>>? sizeNqty,
    num? costPrice,
    num? discount,
    bool? onSale,
    bool? addToHeadline,
    String? name,
    num? restockRequests,
    String? description,
    String? headlineDescription,
    String? docID,
  }) {
    return Stock(
      productType: productType ?? this.productType,
      likes: likes ?? this.likes,
      salePrice: salePrice ?? this.salePrice,
      images: images ?? this.images,
      onSale: onSale ?? this.onSale,
      discount: discount ?? this.discount,
      sizeNqty: sizeNqty ?? this.sizeNqty,
      costPrice: costPrice ?? this.costPrice,
      addToHeadline: addToHeadline ?? this.addToHeadline,
      name: name ?? this.name,
      restockRequests: restockRequests ?? this.restockRequests,
      description: description ?? this.description,
      headlineDescription: headlineDescription ?? this.headlineDescription,
    );
  }
}
