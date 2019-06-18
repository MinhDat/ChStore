import 'dart:async';

import 'package:flutter/material.dart';

class PageViewContainer extends Container {
  @override
  Widget build(BuildContext context) {
    return Container(child: _PageView());
  }
}

class _PageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<_PageView> with WidgetsBindingObserver {
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
    // print("========== dispose ==============");
    _timer.cancel();
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
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _timer = new Timer(new Duration(seconds: 7), () {
      _currentIndex == 4 ? _nextPage(0) : _nextPage(_currentIndex + 1);
    });

    return Container(
      height: screenSize.width - 40,
      width: screenSize.width - 40,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0.0, 8.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: _handlePageChanged,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
