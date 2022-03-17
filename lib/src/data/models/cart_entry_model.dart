import 'dart:convert';

class CartEntryModel {
  final num price;
  final String productName;
  final num quantity;
  final String documentID;
  late num total;

  CartEntryModel(
      {required this.price,
      required this.productName,
      required this.quantity,
      required this.documentID}) {
    total = price * quantity;
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'productName': productName,
      'quantity': quantity,
      'documentID': documentID,
    };
  }

  factory CartEntryModel.fromMap(Map<String, dynamic> map) {
    return CartEntryModel(
      price: map['price'],
      productName: map['productName'],
      quantity: map['quantity'],
      documentID: map['documentID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartEntryModel.fromJson(String source) =>
      CartEntryModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartEntryModel &&
        other.price == price &&
        other.productName == productName &&
        other.quantity == quantity &&
        other.documentID == documentID &&
        other.total == total;
  }

  @override
  int get hashCode {
    return price.hashCode ^
        productName.hashCode ^
        quantity.hashCode ^
        documentID.hashCode ^
        total.hashCode;
  }
}
