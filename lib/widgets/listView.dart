import 'package:flutter/material.dart';
import '../data/product.dart';

//Template Type
const NORMAL_LIST_TYPE = 1;
const SHOPPING_CART_LIST_TYPE = 2;

class ListViewContainer extends Container {
  ListViewContainer({this.allProducts, this.type: NORMAL_LIST_TYPE});
  final List<Product> allProducts;
  final int type;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<Container> productList = allProducts.map((product) {
      List<Widget> productLineSecond = [
        Expanded(
          flex: 5, // 20%
          child: Text(
            "\$${product.price}",
            style: new TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
        (type == SHOPPING_CART_LIST_TYPE
            ? Expanded(
                flex: 5, // 20%
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: new Icon(Icons.remove)),
                    Container(
                      child: Text("0"),
                    ),
                    IconButton(icon: new Icon(Icons.add)),
                  ],
                ),
              )
            : null),
      ].where((child) => child != null).toList();

      return Container(
        height: 130.0,
        width: screenSize.width - 40,
        margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(5.0),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  height: 130.0,
                  width: 120.0,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50.0,
                  width: screenSize.width - 170,
                  padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    product.name,
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  width: screenSize.width - 170,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: new BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: productLineSecond,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: productList,
    );
  }
}
