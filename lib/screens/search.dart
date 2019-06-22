import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Search place',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Center(
          child: Text('Search screen'),
        ),
      ),
    );
  }
}
