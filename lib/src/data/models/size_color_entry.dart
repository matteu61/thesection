import 'package:equatable/equatable.dart';

class ColorSizeEntry extends Equatable {
  final String color;
  final int quantity;
  Map<String, dynamic> toJson() => {'color': color, 'quantity': quantity};
  factory ColorSizeEntry.fromJson(Map<dynamic, dynamic> json) {
    return ColorSizeEntry(color: json['color'], quantity: json['quantity']);
  }
  const ColorSizeEntry({required this.color, required this.quantity});
  @override
  List<Object?> get props => [color, quantity];
}
