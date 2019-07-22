import 'package:flutter/material.dart';

import 'package:ChStore/data/Category.dart';
import 'package:ChStore/data/Product.dart';

//Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;

class ItemCardListView extends StatefulWidget {
  ItemCardListView(this._parentContext, {this.type: NORMAL_LIST_TYPE});
  final BuildContext _parentContext;
  final int type;

  @override
  ItemCardState createState() =>
      new ItemCardState(_parentContext, type: this.type);
}

class ItemCardState extends State<ItemCardListView> {
  ItemCardState(this._parentContext, {this.type});
  // AppLifecycleState appState;

  final BuildContext _parentContext;
  final int type;

  final int firstItem = 0;
  final int lastItem = allProducts.length - 1;

  GestureDetector _renderProductItem(
      Product product,
      double itemWidth,
      double itemMediumWidth,
      double itemMaxWidth,
      bool isLeftColumn,
      int index) {
    final double leftOffset = isLeftColumn ? 20.0 : 5.0;
    final double rightOffset = isLeftColumn ? 5.0 : 20.0;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          _parentContext,
          '/product-detail',
          arguments: product,
        );
      },
      child: Stack(
        children: [
          Container(
            height: ((index == firstItem && isLeftColumn) ||
                    index == lastItem && !isLeftColumn)
                ? itemMediumWidth
                : itemMaxWidth,
            width: itemWidth,
            margin: EdgeInsets.only(
              top: 10.0,
              left: leftOffset,
              right: rightOffset,
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: rightOffset,
            top: 10.0,
            left: leftOffset,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          product.name,
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: new BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Text(
                          "\$${product.price}",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // appState = ItemCardContainer.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final RouteSettings settings = ModalRoute.of(context).settings;
    final Category _category = settings.arguments;

    final double itemWidth = (screenSize.width - 50.0) / 2.0;
    final double itemMediumWidth = screenSize.width / 2.0;
    final double itemMaxWidth = itemMediumWidth * 1.2;

    final List<GestureDetector> leftProduct = <GestureDetector>[];
    final List<GestureDetector> rightProduct = <GestureDetector>[];

    final List<Product> productFilters =
        allProducts.where((item) => (item.categoryId == _category.id)).toList();
    for (int index = 0; index < productFilters.length; index++) {
      final Product product = productFilters[index];
      if (index % 2 == 0) {
        leftProduct.add(_renderProductItem(
            product, itemWidth, itemMediumWidth, itemMaxWidth, true, index));
      } else {
        rightProduct.add(_renderProductItem(
            product, itemWidth, itemMediumWidth, itemMaxWidth, false, index));
      }
    }

    return ListView(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(children: leftProduct),
          ),
          Expanded(
            flex: 5,
            child: Column(children: rightProduct),
          ),
        ],
      )
    ]);
  }
}
