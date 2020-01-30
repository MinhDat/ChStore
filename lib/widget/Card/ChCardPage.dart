import 'dart:async';
import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/model/Product.dart';
import 'package:ChStore/widget/Card/ChCard.dart';

class ChCardPage extends StatefulWidget {
  ChCardPage(this._products);
  final List<Product> _products;
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
          _currentIndex == widget._products.length - 1 ? 0 : _currentIndex + 1;

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
    _timer = new Timer(new Duration(seconds: 7), () {
      _changePage();
    });

    List<GestureDetector> productList = widget._products.map((product) {
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
          itemWidth: System.screenSize.width,
          itemHeight: System.screenSize.width,
        ),
      );
    }).toList();

    return Container(
      height: System.screenSize.width,
      width: System.screenSize.width,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColor.black38,
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
