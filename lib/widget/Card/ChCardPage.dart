import 'dart:async';
import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/data/Product.dart';
import 'package:ChStore/widget/Card/ChCard.dart';

class ChCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChCardPageState();
  }
}

class ChCardPageState extends State<ChCardPage> {
  PageController _pageController;
  int _currentIndex = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController =
        new PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
    _pageController.dispose();
  }

  void _changePage() {
    if (_pageController.hasClients) {
      int delta =
          _currentIndex == allProducts.length - 1 ? 0 : _currentIndex + 1;

      _pageController.animateToPage(
        delta,
        duration: const Duration(milliseconds: 800),
        curve: Curves.ease,
      );
    }
  }

  void _handlePageChanged(int page) {
    _timer.cancel();
    setState(() {
      _currentIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double _screenWidth = screenSize.width - 40;
    double _screenHeight = _screenWidth * 1.2;

    _timer = new Timer(new Duration(seconds: 7), () {
      _changePage();
    });

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
          type: FOR_PAGE_VIEW,
        ),
      );
    }).toList();

    return Container(
      height: _screenHeight,
      width: _screenWidth,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: appColor.black38,
            offset: Offset(0.0, 3.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: _handlePageChanged,
        children: productList,
      ),
    );
  }
}
