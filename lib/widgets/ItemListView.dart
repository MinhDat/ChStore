import 'package:flutter/material.dart';
import '../data/product.dart';

//Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;

class ItemListView extends StatelessWidget {
  ItemListView(this._parentContext, {this.type: NORMAL_LIST_TYPE});
  final BuildContext _parentContext;
  final int type;
  @override
  Widget build(BuildContext context) {
    return ItemListContainer(_parentContext, type: this.type);
  }
}

class ItemListContainer extends StatefulWidget {
  ItemListContainer(this._parentContext, {this.type});
  final BuildContext _parentContext;
  final int type;

  @override
  ItemListState createState() =>
      new ItemListState(_parentContext, type: this.type);
}

class ItemListState extends State<ItemListContainer> {
  ItemListState(this._parentContext, {this.type});
  final BuildContext _parentContext;
  final int type;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<GestureDetector> productList = allProducts.map((product) {
      List<Widget> productLineSecond = [
        Expanded(
          flex: 4, // 20%
          child: Text(
            "\$${product.price}",
            style: new TextStyle(
              fontSize: 15.0,
            ),
          ),
        )
      ];

      switch (type) {
        case SHOPPING_CART_LIST_TYPE:
          productLineSecond.add(
            Expanded(
              flex: 7, // 60%
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: () => product.count > 1
                        ? setState(() => (product.count--))
                        : null,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(product.count.toString()),
                  ),
                  IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () => setState(() => (product.count++)),
                  ),
                ],
              ),
            ),
          );
          break;
      }

      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            _parentContext,
            '/product-detail',
            arguments: product,
          );
        },
        child: Container(
          height: 130.0,
          width: screenSize.width - 40,
          margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(5.0),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 5.0, left: 10.0),
                        child: Text(
                          product.name,
                          style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 10.0, bottom: 10),
                        decoration: new BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: Colors.grey[600]),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: productLineSecond,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: productList,
    );
  }
}
