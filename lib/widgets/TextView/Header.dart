import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header(this.content);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
