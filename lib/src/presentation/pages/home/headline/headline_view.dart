import 'package:flutter/material.dart';

class Headlines extends StatelessWidget {
  const Headlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      height: height,
      width: width,
    );
  }
}
