import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/ScrollHeader.dart';
import 'package:ChStore/widget/Item/ItemList.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollHeader(
        title: "Shopping Cart",
        childAppBar: Text("Progress Trackers"),
        child: ItemList(type: SHOPPING_CART_LIST_TYPE),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
