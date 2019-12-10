import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/screen/ProductCategory/Topic.dart';
import 'package:ChStore/screen/ProductCategory/Category.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Header(),
      Category(),
      Topic(context),
    ]);
  }
}
