import 'dart:async';

import 'package:ChStore/utility/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class ChCardPage extends StatefulWidget {
  ChCardPage(this._products);
  final List<Product> _products;
  @override
  State<StatefulWidget> createState() {
    return ChCardPageState();
  }
}

class ChCardPageState extends State<ChCardPage> {
  List<GlobalKey<LinearPageProgressState>> activations;
  PageController _pageController;
  int _currentIndex = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    activations = List.generate(widget._products.length, (i) => GlobalKey());
    _currentIndex = 0;
    _pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
    _nextPage();
  }

  @override
  void dispose() {
    if (_timer != null && _timer.isActive) _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _changePage() {
    if (_pageController.hasClients) {
      int delta =
          _currentIndex == widget._products.length - 1 ? 0 : _currentIndex + 1;

      _pageController.animateToPage(delta,
          duration: const Duration(milliseconds: 800), curve: Curves.ease);
    }
  }

  void _handlePageChanged(int page) {
    for (int i = 0; i < page; i++) {
      activations[i].currentState.setProgress(2);
    }
    for (int i = page + 1; i < activations.length; i++) {
      activations[i].currentState.setProgress(1);
    }
    activations[page].currentState.setProgress(0);

    setState(() {
      _currentIndex = page;
      _nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> productList = widget._products.map((product) {
      return GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, '/product-detail', arguments: product),
        child: ChCard(
          product,
          type: FOR_PAGE_VIEW,
          itemWidth: System.screenSize.width,
          itemHeight: System.screenSize.width * 0.6,
        ),
      );
    }).toList();

    return Container(
      height: System.screenSize.width * 0.85,
      width: System.screenSize.width,
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ChColor.shadow,
            offset: Offset(0.0, 3.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: _handlePageChanged,
            children: productList,
          ),
          Positioned(
            top: System.screenSize.width * 0.4,
            child: Container(
              width: System.screenSize.width - 40,
              child: ProgressList(activations: activations, seconds: 7),
            ),
          )
        ],
      ),
    );
  }

  void _nextPage() {
    if (_timer != null && _timer.isActive) _timer.cancel();

    _timer = new Timer(new Duration(seconds: 7), () {
      _changePage();
    });
  }
}
