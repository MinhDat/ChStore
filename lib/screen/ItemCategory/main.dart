import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';

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
