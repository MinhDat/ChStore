import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/ScrollHeader.dart';
import 'package:ChStore/widget/Item/ItemList.dart';
import 'package:ChStore/widget/Button/Progress/RadialProgress.dart';
import 'package:ChStore/widget/Button/Progress/LinearProgress.dart';
import 'package:ChStore/utils/MixColor.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollHeader(
        title: "Shopping Cart",
        childAppBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadialProgress(
              child: Icon(
                Icons.shopping_basket,
                color: mixColor.completeColor,
              ),
            ),
            LinearProgress(),
            RadialProgress(
              child: Icon(
                Icons.playlist_add_check,
                color: mixColor.completeColor,
              ),
            ),
            LinearProgress(),
            RadialProgress(
              child: Icon(
                Icons.done,
                color: mixColor.completeColor,
              ),
            ),
          ],
        ),
        child: ItemList(type: SHOPPING_CART_LIST_TYPE),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
