import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/Item/CircleItem.dart';

class FourCircleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _itemWidth = (chSystem.screenSize.width - 40) / 4;

    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CircleItem(
              itemWidth: _itemWidth,
              title: "Sport",
            ),
          ),
          Expanded(
            flex: 2,
            child: CircleItem(
              itemWidth: _itemWidth,
              title: "Woman",
            ),
          ),
          Expanded(
            flex: 2,
            child: CircleItem(
              itemWidth: _itemWidth,
              title: "Man",
            ),
          ),
          Expanded(
            flex: 2,
            child: CircleItem(
              itemWidth: _itemWidth,
              title: "Kid",
            ),
          ),
        ],
      ),
    );
  }
}
