import 'package:flutter/material.dart';
import 'package:ChStore/data/Product.dart';
import 'package:ChStore/data/Category.dart';
import 'package:ChStore/widget/Button/CounterButton.dart';

// Constants
const RADIUS = 10.0;
// Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;

class ItemList extends StatefulWidget {
  ItemList({this.type: NORMAL_LIST_TYPE});
  final int type;

  @override
  ItemListState createState() => new ItemListState(type: this.type);
}

class ItemListState extends State<ItemList> {
  ItemListState({this.type});
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
              flex: 6, // 60%
              child: CounterButton(
                count: product.count,
                id: product.id,
              ),
            ),
          );
          break;
      }

      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
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
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5.0, left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allCategories[product.categoryId]
                                .name
                                .toUpperCase(),
                            style: new TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text(
                            product.name,
                            style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 10.0),
                      padding: EdgeInsets.only(bottom: 10),
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
