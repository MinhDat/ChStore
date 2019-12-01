import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/widget/CustomText/Header.dart';

class ScrollHeader extends StatelessWidget {
  ScrollHeader({
    this.title: "",
    this.isAutoScroll: false,
    this.scrollController,
    @required this.childAppBar,
    @required this.child,
  });
  final String title;
  final bool isAutoScroll;
  final Widget childAppBar;
  final Widget child;
  final ScrollController scrollController;
  // PageController _pageController =
  //     PageController(initialPage: 0, keepPage: true);

  // @override
  // void initState() {
  //   super.initState();
  //   _currentIndex = 0;
  //   _pageController =
  //       new PageController(initialPage: _currentIndex, keepPage: true);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.white,
      child: SafeArea(
        child: NestedScrollView(
          controller: scrollController ?? ScrollController(),
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) =>
              <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeader(
                headerHeight: 40,
                isAutoScroll: isAutoScroll,
                title: title,
              ),
              pinned: true,
            ),
            SliverAppBar(
              pinned: true,
              expandedHeight: isAutoScroll ? 0.0 : 95.0,
              floating: !isAutoScroll,
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(isAutoScroll ? 0.0 : 95.0), // Add this code
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(""),
                ), // Add this code
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: <Widget>[
                      !isAutoScroll
                          ? Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20.0),
                              child: Header(title),
                            )
                          : null,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: childAppBar,
                      ),
                    ].where((f) => f != null).toList(),
                  );
                },
              ),
            ),
          ],
          body: child,
        ),
      ),
    );
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  final double headerHeight;
  final String title;
  bool isAutoScroll;

  SliverHeader(
      {@required this.headerHeight, this.isAutoScroll: false, this.title: ""});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: appColor.white,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Center(
            child: Opacity(
              opacity: this.isAutoScroll ? 1 : (shrinkOffset / headerHeight),
              child: Text(
                title,
                style: TextStyle(
                  color: appColor.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => headerHeight;

  @override
  double get minExtent => headerHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
