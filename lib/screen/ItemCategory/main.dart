import 'package:flutter/material.dart';
import 'package:ChStore/widget/Card/SmallChCardList.dart';
import 'package:ChStore/data/Topic.dart';

class ItemCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Topic topic = settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${topic.name} categories"),
      ),
      body: ListView(children: [
        SmallChCardList(context),
      ]),
    );
  }
}
