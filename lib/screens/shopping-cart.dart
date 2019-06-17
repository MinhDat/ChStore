import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Shopping cart place',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Center(
          child: Text('Shopping cart screen'),
        ),
      ),
    );
  }
}
