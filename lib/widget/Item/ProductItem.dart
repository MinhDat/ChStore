import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {this.type: NORMAL_LIST_TYPE, this.item, this.animateCart: false});
  final int type;
  final Product item;
  final bool animateCart;
  @override
  Widget build(BuildContext context) {
    List<Widget> productLineSecond = [
      Expanded(
          flex: 4, child: Text("\$${item.price}", style: Style.productPrice))
    ];

    switch (type) {
      case NORMAL_LIST_TYPE:
        productLineSecond.add(
          Expanded(
            flex: 6, // 60%
            child: AddToCart(item,
                size: TextSize.size30, animateCart: this.animateCart),
          ),
        );
        break;

      case SHOPPING_CART_LIST_TYPE:
        productLineSecond.add(
          Expanded(flex: 6, child: Counter(item.id)),
        );
        break;
    }

    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataError) {
        return Center(child: Text('failed to fetch data'));
      }
      if (state is DataLoaded) {
        var category = state.topics.firstWhere((t) => t.id == item.categoryId,
            orElse: () =>
                state.categories.firstWhere((t) => t.id == item.categoryId));

        return GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, '/product-detail', arguments: item),
          child: Container(
            height: 130.0,
            padding: const EdgeInsets.only(top: 5.0),
            color: AppColor.main,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(5.0),
                      child: Image.network(item.thumbnail, fit: BoxFit.cover),
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
                            Text(category.name.toUpperCase(),
                                style: Style.categoryLabel),
                            Text(item.name,
                                style: Style.productName, maxLines: 2),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: new BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 0.5, color: AppColor.initialization),
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
    });
  }
}
