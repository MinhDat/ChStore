import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Categories place',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Center(
          child: Text('Categories screen'),
        ),
      ),
    );
  }
}
