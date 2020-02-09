import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/screen/main.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableHeader(
      title: "Discovery",
      headerAppBar: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 20.0),
        child: Text("Discovery", style: ChTextStyle.logo),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text('Categories', style: ChTextStyle.title),
          ),
          CategoryView(),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text('Topics', style: ChTextStyle.title),
          ),
          TopicView(context),
        ],
      ),
    );
  }
}
