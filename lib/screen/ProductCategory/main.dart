import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/screen/ProductCategory/Topic.dart';
import 'package:ChStore/screen/ProductCategory/Category.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Header(),
      Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text('Categories', style: appTextStyle.title),
      ),
      Category(),
      Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Text('Topics', style: appTextStyle.title),
      ),
      Topic(context),
    ]);
  }
}
