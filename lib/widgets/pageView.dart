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
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  void _nextPage(int delta) {
    _timer.cancel();
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        delta,
        duration: const Duration(milliseconds: 800),
        curve: Curves.ease,
      );
    }
  }

  void _handlePageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
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
          child: Stack(
            children: [
              Container(
                height: (screenSize.width - 40),
                width: screenSize.width - 40,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -1.0,
                right: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: (screenSize.width - 40) / 2.0,
                    width: screenSize.width - 40,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: (screenSize.width - 40) / 2.0 - 30.0,
                          width: screenSize.width - 40,
                          padding: EdgeInsets.only(left: 10.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            product.name,
                            style: new TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: screenSize.width - 40,
                          padding: EdgeInsets.only(left: 10.0),
                          decoration: new BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Text(
                            "\$${product.price}",
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
