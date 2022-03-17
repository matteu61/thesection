import 'package:thesection/src/data/data_providers/stock_data_provider.dart';

import '../models/stock_model.dart';

class StockRepo {
  StockDao stock = StockDao();
  late Future<Future<List<Stock>>> stockStream;
  StockRepo() {
    stockStream = stock.getStockStream();
  }
  Future<Future<List<Stock>>> streamList() {
    return stockStream;
  }
}
