import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Home places',
      theme: ThemeData(primaryColor: Colors.white),
      home: HorizontalList(),
    );
  }
}

class HorizontalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<HorizontalList> with WidgetsBindingObserver {
  // AppLifecycleState _notification;
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
  build(BuildContext context) {
    _timer = new Timer(new Duration(seconds: 7), () {
      _currentIndex == 4 ? _nextPage(0) : _nextPage(_currentIndex + 1);
    });

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: _handlePageChanged,
              children: <Widget>[
                Container(
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.red,
                ),
                Container(
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.blue,
                ),
                Container(
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.green,
                ),
                Container(
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.yellow,
                ),
                Container(
                  width: screenSize.width - 40,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          ContactList(),
        ],
      ),
    );
  }
}
