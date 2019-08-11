import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/screen/ProductCategory/CategoryList.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Header(),
      CategoryList(context),
    ]);
  }
}
