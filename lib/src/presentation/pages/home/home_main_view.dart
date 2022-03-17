import 'package:flutter/material.dart';
import 'package:thesection/src/presentation/pages/settings/stats/stock/add_stock_view.dart';

/// Displays a list of SampleItems.
class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [AddStockBuilder()],
      ),
    );
  }
}
