import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;

class ItemList extends StatefulWidget {
  ItemList({this.products, this.type: NORMAL_LIST_TYPE});
  final int type;
  final List<Product> products;

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    switch (widget.type) {
      case NORMAL_LIST_TYPE:
        if (productList.length == 0) {
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
                    counterBloc.add(DecrementEvent(item.count));
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
      child: Text("No items", style: ChTextStyle.noItem),
    );
  }
}

Widget stackBehindDismiss() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20.0),
    color: ChColor.primaryLight,
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}
