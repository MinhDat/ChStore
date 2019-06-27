import 'package:flutter/material.dart';
import '../../data/category.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Category category = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.name} category"),
      ),
      body: Center(
        child: Text('Card view'),
      ),
    );
  }
}
