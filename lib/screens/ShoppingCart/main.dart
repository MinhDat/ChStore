import 'package:flutter/material.dart';

import '../../widgets/HeaderView.dart';
import '../../widgets/ItemListView.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderView(),
        ItemListView(context, type: SHOPPING_CART_LIST_TYPE),
      ],
    );
  }
}
