import 'package:flutter/material.dart';

import 'package:ChStore/widgets/HeaderView.dart';
import 'package:ChStore/widgets/CategoryListView.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      HeaderView(),
      CategoryListView(context),
    ]);
  }
}
