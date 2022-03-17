part of 'stock_bloc.dart';

@immutable
abstract class StockState {}

class LoadingStock extends StockState {}

class StockLoaded extends StockState {}
