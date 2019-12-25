import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/data/Product.dart';
import 'package:ChStore/widget/Card/ChCard.dart';

class ChCardSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChCardSliderState();
  }
}

class ChCardSliderState extends State<ChCardSlider> {
  List<GestureDetector> _renderList() {
    List<GestureDetector> productList = allProducts.map((product) {
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
    double _screenWidth = chSystem.screenSize.width - 40;
    double _screenHeight = _screenWidth / 1.2;

    return Container(
      height: _screenHeight,
      width: _screenWidth,
      padding: const EdgeInsets.only(left: 20.0),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _renderList(),
      ),
    );
  }
}
