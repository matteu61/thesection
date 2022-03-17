import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thesection/src/data/models/stock_model.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(LoadingStock()) {
    on<StockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
