import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/Button/Counter.dart';
import 'package:ChStore/widget/Button/AddCart.dart';

import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:ChStore/data/Product.dart';
import 'package:ChStore/data/Topic.dart';

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

  GestureDetector _renderItem(Product item, Size size) {
    List<Widget> productLineSecond = [
      Expanded(
        flex: 4, // 20%
        child: Text("\$${item.price}", style: appTextStyle.price),
      )
    ];
    switch (type) {
      case NORMAL_LIST_TYPE:
        productLineSecond.add(
          Expanded(
            flex: 6, // 60%
            child: AddCart(data: item),
          ),
        );
        break;

      case SHOPPING_CART_LIST_TYPE:
        productLineSecond.add(
          Expanded(
            flex: 6, // 60%
            child: Counter(
              count: item.count,
              id: item.id,
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
          arguments: item,
        );
      },
      child: Container(
        height: 130.0,
        width: size.width - 40,
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
                    item.image,
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
                        Text(allTopics[item.categoryId].name.toUpperCase(),
                            style: appTextStyle.categoryLabel),
                        Text(item.name, style: appTextStyle.itemName),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 10.0),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: new BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: appColor.grey500),
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
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List productList = [];

    switch (type) {
      case NORMAL_LIST_TYPE:
        productList = allProducts
            .map((product) => _renderItem(product, screenSize))
            .toList();
        break;

      case SHOPPING_CART_LIST_TYPE:
        productList = allShoppingCarts
            .map(
              (item) => Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(item),
                child: _renderItem(item, screenSize),
                onDismissed: (direction) {
                  chSystem.countDown(item.count);
                  item.count = 1;
                  allShoppingCarts.removeWhere((p) => p.id == item.id);
                },
              ),
            )
            .toList();
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: productList,
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
