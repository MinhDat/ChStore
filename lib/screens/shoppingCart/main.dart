import 'package:flutter/material.dart';
import '../../data/product.dart';
import '../../widgets/listView.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingCartContainer(),
    );
  }
}

class ShoppingCartContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<ShoppingCartContainer> {
  @override
  build(BuildContext context) {
    return ListView(
      children: [
        ListViewContainer(type: SHOPPING_CART_LIST_TYPE),
      ],
    );
  }
}
