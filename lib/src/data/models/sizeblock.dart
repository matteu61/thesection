import 'package:equatable/equatable.dart';
import 'package:thesection/src/data/models/size_color_entry.dart';

class SizeBlock extends Equatable {
  final String size;
  final List<Map<String, dynamic>> colQty;
  const SizeBlock({required this.size, required this.colQty});
  factory SizeBlock.fromJson(Map<dynamic, dynamic> json) {
    return SizeBlock(size: json['size'], colQty: json['sizeNqty']);
  }
  Map<String, dynamic> toJson() {
    return {'size': size, 'colorNqty': colQty};
  }

  @override
  List<Object?> get props => [colQty, size];
}
