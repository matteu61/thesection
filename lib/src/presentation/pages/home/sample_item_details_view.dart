import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  static const routeName = '/items';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: ListView(
        children: const [Text('More Information Here')],
      ),
    );
  }
}
