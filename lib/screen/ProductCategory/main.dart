import 'CategoryView.dart';
import 'TopicView.dart';

import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollPage(
      title: "Discovery",
      headerAppBar: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 10.0),
        child: Text("Discovery", style: ChTextStyle.logo),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text('Categories', style: ChTextStyle.title),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: CategoryView(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Topics', style: ChTextStyle.title),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: TopicView(context),
          ),
        ],
      ),
    );
  }
}
