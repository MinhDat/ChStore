import 'package:flutter/material.dart';
import 'package:ChStore/widgets/ItemCardListView.dart';
import 'package:ChStore/data/Category.dart';

class ItemCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Category category = settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${category.name} categories"),
      ),
      body: ItemCardListView(context),
    );
  }
}
