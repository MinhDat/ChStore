import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ChStore/data/Product.dart';
import 'package:ChStore/widget/CardWidget/ChCard.dart';

class ChCardSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChCardSliderState();
  }
}

class ChCardSliderState extends State<ChCardSlider>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: allProducts.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double _screenWidth = screenSize.width - 40;
    double _screenHeight = _screenWidth * 1.2;

    List<GestureDetector> productList = allProducts.map((product) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/product-detail',
            arguments: product,
          );
        },
        child: ChCard(
          product,
          type: NONE,
        ),
      );
    }).toList();

    return Container(
      height: _screenHeight,
      width: _screenWidth,
      padding: const EdgeInsets.only(left: 20.0),
      child: TabBarView(
        children: productList,
        controller: _tabController,
      ),
    );
  }
}
