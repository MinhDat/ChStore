import 'package:ChStore/utility/System.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/model/Product.dart';
import 'package:ChStore/widget/Card/ChCard.dart';

class ChCardSlider extends StatefulWidget {
  ChCardSlider(this._products);
  final List<Product> _products;

  @override
  State<StatefulWidget> createState() {
    return ChCardSliderState();
  }
}

class ChCardSliderState extends State<ChCardSlider> {
  List<GestureDetector> _renderList() {
    List<GestureDetector> productList = widget._products.map((product) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/product-detail',
            arguments: product,
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: ChCard(
            product,
            itemWidth: System.screenSize.width / 1.4,
            type: FOR_SLIDER,
            // itemWidth: _screenWidth - 20,
          ),
        ),
      );
    }).toList();

    return productList;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = System.screenSize.width / 1.7;

    return Container(
      height: _screenHeight,
      // width: _screenWidth,
      padding: const EdgeInsets.only(left: 20.0),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _renderList(),
      ),
    );
  }
}
