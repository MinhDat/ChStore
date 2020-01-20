import 'package:flutter/material.dart';
import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';

// Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;
// Maximum Item
const MAXIMUM_ITEM = 5;

class ItemList extends StatefulWidget {
  ItemList({this.type: NORMAL_LIST_TYPE, this.maxItem: 0, this.products});
  final int type;
  final int maxItem;
  List<Product> products;

  @override
  ItemListState createState() => new ItemListState();
}

class ItemListState extends State<ItemList> {
  List<Widget> productList;
  @override
  void initState() {
    super.initState();
    productList = [];
  }

  @override
  void despose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case NORMAL_LIST_TYPE:
        if (widget.maxItem > 0 && productList.length == 0) {
          for (int i = 0; i < widget.maxItem; i++) {
            productList
                .add(ProductItem(type: widget.type, item: widget.products[i]));
          }
        }
        if (widget.maxItem == 0 && productList.length == 0) {
          productList = widget.products
              .map((product) => ProductItem(item: product))
              .toList();
        }

        return Column(children: productList);

      case SHOPPING_CART_LIST_TYPE:
        if (allShoppingCarts.isNotEmpty) {
          productList = allShoppingCarts
              .map(
                (item) => Dismissible(
                  background: stackBehindDismiss(),
                  key: ObjectKey(item),
                  child: ProductItem(type: widget.type, item: item),
                  onDismissed: (direction) {
                    System.countDown(item.count);
                    item.count = 1;
                    allShoppingCarts.removeWhere((p) => p.id == item.id);
                  },
                ),
              )
              .toList();
          return ListView(children: productList);
        }
    }
    return Center(
      child: Text("No items", style: AppTextStyle.noItem),
    );
  }
}

Widget stackBehindDismiss() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20.0),
    color: AppColor.red300,
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}
