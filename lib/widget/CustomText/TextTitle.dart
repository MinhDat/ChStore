import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  TextTitle(this.content);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
