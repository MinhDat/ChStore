import 'package:ChStore/model/main.dart';
import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductItem({this.type: NORMAL_LIST_TYPE, this.item});
  final int type;
  final Product item;
  @override
  Widget build(BuildContext context) {
    List<Widget> productLineSecond = [
      Expanded(
        flex: 4, // 20%
        child: Text("\$${item.price}", style: AppTextStyle.price),
      )
    ];
    var category = allTopics.firstWhere((t) => t.id == item.categoryId,
        orElse: () => allCategories.firstWhere((t) => t.id == item.categoryId));
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
        width: System.screenSize.width - 40,
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
                    item.thumbnail,
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
                        Text(category.name.toUpperCase(),
                            style: AppTextStyle.categoryLabel),
                        Text(
                          item.name,
                          style: AppTextStyle.itemName,
                          maxLines: 2,
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
}
