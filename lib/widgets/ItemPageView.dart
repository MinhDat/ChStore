import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ChStore/data/Product.dart';

const RADIUS_CIRCULAR = 20.0;

class ItemPageView extends StatefulWidget {
  ItemPageView(this._parentContext);
  final BuildContext _parentContext;

  @override
  State<StatefulWidget> createState() {
    return ItemPageState(_parentContext);
  }
}

class ItemPageState extends State<ItemPageView> {
  ItemPageState(this._parentContext);
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
    if (_pageController.hasClients) {
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
    double ITEM_WIDTH = screenSize.width - 40;
    double ITEM_HEIGHT = ITEM_WIDTH * 1.2;

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
              ClipRRect(
                borderRadius: new BorderRadius.circular(RADIUS_CIRCULAR),
                child: Image.asset(
                  product.image,
                  height: ITEM_HEIGHT,
                  width: ITEM_WIDTH,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 10.0, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -1.0,
                right: 0,
                top: ITEM_HEIGHT / 2.0,
                left: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(RADIUS_CIRCULAR),
                        bottomRight: Radius.circular(RADIUS_CIRCULAR),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Container(
      height: ITEM_HEIGHT,
      width: ITEM_WIDTH,
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
