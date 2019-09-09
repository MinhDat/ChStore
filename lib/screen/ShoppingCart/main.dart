import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/widget/Item/ItemList.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header(),
        ItemList(type: SHOPPING_CART_LIST_TYPE),
      ],
    );
  }
}
