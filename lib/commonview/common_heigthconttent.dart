import 'package:flutter/material.dart';

class CommonHeigthContent extends StatelessWidget {
  final double? height;
  const CommonHeigthContent({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class CommonWeigthContent extends StatelessWidget {
  final double? width;
  const CommonWeigthContent({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}