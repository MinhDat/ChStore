import 'dart:async';
import 'package:flutter/material.dart';

import '../data/product.dart';
// import '../routes.dart';

class PageViewContainer extends Container {
  PageViewContainer(this.allProducts, this._parentContext);
  final List<Product> allProducts;
  final BuildContext _parentContext;

  @override
  Widget build(BuildContext context) {
    return Container(child: _PageView(allProducts, _parentContext));
  }
}

class _PageView extends StatefulWidget {
  _PageView(this.allProducts, this._parentContext);
  final List<Product> allProducts;
  final BuildContext _parentContext;

  @override
  State<StatefulWidget> createState() {
    return _WidgetList(allProducts, _parentContext);
  }
}

class _WidgetList extends State<_PageView> with WidgetsBindingObserver {
  _WidgetList(this.allProducts, this._parentContext);
  final List<Product> allProducts;
  final BuildContext _parentContext;

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
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    _pageController.animateToPage(
      delta,
      duration: const Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  void _handlePageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _timer = new Timer(new Duration(seconds: 7), () {
      _currentIndex == allProducts.length - 1
          ? _nextPage(0)
          : _nextPage(_currentIndex + 1);
    });

    List<GestureDetector> productList = allProducts.map((product) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            _parentContext,
            '/product-detail',
            arguments: product,
          );
        },
        child: Container(
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(10.0),
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }).toList();

    return Container(
      height: screenSize.width - 40,
      width: screenSize.width - 40,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0.0, 3.0),
            blurRadius: 10.0,
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
