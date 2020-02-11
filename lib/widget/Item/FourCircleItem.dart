import 'package:ChStore/model/main.dart';
import 'package:ChStore/utility/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Item/CircleItem.dart';

class FourCircleItem extends StatelessWidget {
  FourCircleItem(this.types);
  final List<ProductType> types;

  @override
  Widget build(BuildContext context) {
    double _itemWidth = (System.screenSize.width - 40) / 4;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: types
          .map((type) => Expanded(
                flex: 2,
                child: CircleItem(
                  itemWidth: _itemWidth,
                  title: type.name,
                  image: type.image,
                ),
              ))
          .toList(),
    );
  }
}
