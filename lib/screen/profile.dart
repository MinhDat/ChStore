import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Profile place',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Center(
          child: Text('Profile screen'),
        ),
      ),
    );
  }
}
