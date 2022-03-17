part of 'stock_bloc.dart';

@immutable
abstract class StockEvent {}

class StockUpdated extends StockEvent {}

class StockEdited extends StockEvent {}

class StockDeleted extends StockEvent {}

class Stockloading extends StockEvent {}

class StockLoadingFailed extends StockEvent {}

class StockNameUpdated extends StockEvent {}

class StockFormSent extends StockEvent {}

class StockPriceUpdated extends StockEvent {}

class EditStock extends StockEvent {}

class DeleteStock extends StockEvent {}

class AddStock extends StockEvent {
  final Stock stockData;

  AddStock({required this.stockData});
}
