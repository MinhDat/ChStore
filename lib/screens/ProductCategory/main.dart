import 'package:flutter/material.dart';

import 'package:ChStore/widgets/Header/main.dart';
import 'package:ChStore/widgets/CustomLists/CategoryList.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Header(),
      CategoryList(context),
    ]);
  }
}
