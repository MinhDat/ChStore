import 'package:flutter/material.dart';
import '../../data/product.dart';
import '../../widgets/listView.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart(this.allProducts);
  final List<Product> allProducts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Shopping cart place',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: ShoppingCartContainer(allProducts),
      ),
    );
  }
}

class ShoppingCartContainer extends StatefulWidget {
  ShoppingCartContainer(this.allProducts);
  final List<Product> allProducts;
  @override
  State<StatefulWidget> createState() {
    return _WidgetList(allProducts);
  }
}

class _WidgetList extends State<ShoppingCartContainer> {
  _WidgetList(this.allProducts);
  final List<Product> allProducts;

  @override
  build(BuildContext context) {
    return ListView(
      children: [
        ListViewContainer(
            allProducts: allProducts, type: SHOPPING_CART_LIST_TYPE),
      ],
    );
  }
}
