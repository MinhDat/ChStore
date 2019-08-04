import 'package:flutter/material.dart';

import 'package:ChStore/widgets/Header/main.dart';
import 'package:ChStore/widgets/CustomLists/ItemList.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header(),
        ItemList(context, type: SHOPPING_CART_LIST_TYPE),
      ],
    );
  }
}
