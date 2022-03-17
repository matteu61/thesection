import 'package:equatable/equatable.dart';

class PutOnSale extends Equatable {
  final bool putOnSale;
  const PutOnSale({required this.putOnSale});
  @override
  List<Object?> get props => [putOnSale];
}

class AddHilight extends Equatable {
  final bool added;
  const AddHilight({required this.added});
  @override
  List<Object?> get props => [added];
}
