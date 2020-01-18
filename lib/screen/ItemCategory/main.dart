import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Card/SmallChCardList.dart';
import 'package:ChStore/model/Topic.dart';

class ItemCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    Topic topic = settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${topic.name}", style: AppTextStyle.normal),
      ),
      body: ListView(children: [
        SmallChCardList(context),
      ]),
    );
  }
}
