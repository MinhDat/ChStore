import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/screen/main.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollHeader(
      title: "Discovery",
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Categories', style: AppTextStyle.title),
          ),
          Category(),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text('Topics', style: AppTextStyle.title),
          ),
          Topic(context),
        ],
      ),
    );
  }
}
