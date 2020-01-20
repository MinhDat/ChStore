import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';

// Template Type
const NORMAL_LIST_TYPE = 0;
const SHOPPING_CART_LIST_TYPE = 1;
// Maximum Item
const MAXIMUM_ITEM = 5;

class ItemList extends StatefulWidget {
  ItemList({this.type: NORMAL_LIST_TYPE, this.maxItem: MAXIMUM_ITEM});
  final int type;
  final int maxItem;

  @override
  ItemListState createState() => new ItemListState();
}

class ItemListState extends State<ItemList> {
  ProductBloc _productBloc;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];

    switch (widget.type) {
      case NORMAL_LIST_TYPE:
        return BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
          if (state is ProductError) {
            return Center(
              child: Text('failed to fetch products'),
            );
          }
          if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return Center(
                child: Text("No items", style: AppTextStyle.noItem),
              );
            }
            products = state.products;
          }

          if (widget.maxItem > 0) {
            for (int i = 0; i < widget.maxItem; i++) {
              productList.add(_renderItem(
                  context, widget.type, products[i], System.screenSize));
            }
          } else {
            productList = products
                .map((product) => _renderItem(
                    context, widget.type, product, System.screenSize))
                .toList();
          }

          return Column(children: productList);
        });

      case SHOPPING_CART_LIST_TYPE:
        if (allShoppingCarts.isEmpty) {
          return Center(
            child: Text("No items", style: AppTextStyle.noItem),
          );
        }
        productList = allShoppingCarts
            .map(
              (item) => Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(item),
                child:
                    _renderItem(context, widget.type, item, System.screenSize),
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
}

/// Render an items
Widget _renderItem(BuildContext context, int type, Product item, Size size) {
  List<Widget> productLineSecond = [
    Expanded(
      flex: 4, // 20%
      child: Text("\$${item.price}", style: AppTextStyle.price),
    )
  ];
  switch (type) {
    case NORMAL_LIST_TYPE:
      productLineSecond.add(
        Expanded(
          flex: 6, // 60%
          child: AddToCart(
            item,
            size: AppTextSize.size30,
            showIcon: false,
          ),
        ),
      );
      break;

    case SHOPPING_CART_LIST_TYPE:
      productLineSecond.add(
        Expanded(
          flex: 6, // 60%
          child: Counter(item.id),
        ),
      );
      break;
  }

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/product-detail', arguments: item);
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
                child: Image.network(
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
                          style: AppTextStyle.categoryLabel),
                      Text(item.name, style: AppTextStyle.itemName),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 10.0),
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: AppColor.grey500),
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
