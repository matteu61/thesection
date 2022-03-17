import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView(
      {Key? key,
      required this.height,
      required this.width,
      required this.message})
      : super(key: key);

  final double height;
  final double width;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Center(
            child: SizedBox(
              width: width,
              height: 76.0,
              child: Center(
                  child: Column(
                children: [
                  const Flexible(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator()),
                      )),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        message,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
