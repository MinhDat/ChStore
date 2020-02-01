import 'package:ChStore/model/main.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Item/CircleItem.dart';

class FourCircleItem extends StatelessWidget {
  FourCircleItem(this.types);
  final List<ProductType> types;

  @override
  Widget build(BuildContext context) {
    double _itemWidth = (System.screenSize.width - 40) / 4;

    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
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
              .toList()
          //   <Widget>[
          //   Expanded(
          //     flex: 2,
          //     child: CircleItem(
          //       itemWidth: _itemWidth,
          //       title: "Pant",
          //       image: "icons/pant.png",
          //     ),
          //   ),
          //   Expanded(
          //     flex: 2,
          //     child: CircleItem(
          //       itemWidth: _itemWidth,
          //       title: "Hat",
          //       image: "icons/hat.png",
          //     ),
          //   ),
          //   Expanded(
          //     flex: 2,
          //     child: CircleItem(
          //       itemWidth: _itemWidth,
          //       title: "Bikini",
          //       image: "icons/bikini.png",
          //     ),
          //   ),
          //   Expanded(
          //     flex: 2,
          //     child: CircleItem(
          //       itemWidth: _itemWidth,
          //       title: "Tie",
          //       image: "icons/tie.png",
          //     ),
          //   ),
          // ],
          ),
    );
  }
}
