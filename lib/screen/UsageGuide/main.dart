import 'package:ChStore/screen/UsageGuide/Finish.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/DotsIndicator/main.dart';

class UsageGuide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsageGuideState();
  }
}

class UsageGuideState extends State<UsageGuide> {
  PageController _pageController;
  int _currentIndex;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

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
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new FlutterLogo(colors: Colors.blue),
      ),
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new FlutterLogo(
            style: FlutterLogoStyle.stacked, colors: Colors.red),
      ),
      Finish(),
    ];

    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              itemCount: _pages.length,
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _pageController.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
