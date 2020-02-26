import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/main.dart';

import 'Finish.dart';

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
  final _kArrowColor = AppColor.title.withOpacity(0.8);

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 105, right: 20, left: 20, bottom: 40),
        child: CardWrapper(
          child: Center(child: Text("ChStore")),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 105, right: 20, left: 20, bottom: 40),
        child: CardWrapper(
          child: Center(child: Text("ChStore")),
        ),
      ),
      Finish(),
    ];

    return Scaffold(
      body: IconTheme(
        data: IconThemeData(color: _kArrowColor),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("lib/asset/image/background/bg1_body.jpg"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter),
              ),
            ),
            PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) =>
                  _pages[index % _pages.length],
              itemCount: _pages.length,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _pageController.animateToPage(page,
                          duration: _kDuration, curve: _kCurve);
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
