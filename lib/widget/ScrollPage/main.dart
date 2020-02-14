import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

// Show header type
const SHOW_HEADER = true;
const NOT_SHOW_HEADER = true;

const HEADER_HEIGHT = 40.0;
const APP_BAR_HEIGHT = 105.0;

const HAS_FOCUSED = true;
const HAS_NOT_FOCUSED = false;

class ScrollPage extends StatelessWidget {
  final String title;
  final bool isFocused;
  final bool isShowHeader;
  final Widget headerAppBar;
  final Widget childAppBar;
  final Widget child;
  final ScrollController scrollController;
  final bool enableIcon;

  ScrollPage(
      {this.title: "",
      this.isFocused: false,
      this.isShowHeader: true,
      this.scrollController,
      this.headerAppBar,
      this.childAppBar,
      @required this.child,
      this.enableIcon: false});

  final double _appBarMaxHeght = System.screenSize.width / 2.5;
  final double _appBarMinHeght = System.screenSize.width / 7;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/picture/background/bg1_body.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: SafeArea(
        child: NestedScrollView(
          controller: scrollController ?? ScrollController(),
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) =>
              <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeader(
                  headerHeight: HEADER_HEIGHT,
                  isFocused: isFocused,
                  title: title,
                  enableIcon: enableIcon),
              pinned: true,
            ),
            SliverAppBar(
              backgroundColor: ChColor.main_v1.withOpacity(0),
              pinned: true,
              expandedHeight: isFocused
                  ? 0
                  : (childAppBar != null
                      ? isShowHeader ? _appBarMaxHeght : APP_BAR_HEIGHT
                      : _appBarMinHeght),
              floating: !isFocused,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(isFocused
                    ? 0
                    : (childAppBar != null
                        ? isShowHeader ? _appBarMaxHeght : APP_BAR_HEIGHT
                        : _appBarMinHeght)), // Add this code
                child: SizedBox.shrink(), // Add this code
              ),
              flexibleSpace: Column(
                children: <Widget>[
                  !isShowHeader
                      ? Container(height: HEADER_HEIGHT - 10)
                      : SizedBox.shrink(),
                  isShowHeader && !isFocused ? headerAppBar : SizedBox.shrink(),
                  ChildAppBar(
                      isFocused: isFocused,
                      isShowHeader: isShowHeader,
                      childAppBar: childAppBar)
                ],
              ),
            ),
          ],
          body: Container(
              color: ChColor.background.withOpacity(0.5), child: child),
        ),
      ),
    );
  }
}

class ChildAppBar extends StatelessWidget {
  final bool isFocused;
  final bool isShowHeader;
  final Widget childAppBar;

  ChildAppBar({
    this.isFocused: false,
    this.isShowHeader: true,
    @required this.childAppBar,
  });
  @override
  Widget build(BuildContext context) {
    return childAppBar != null
        ? Container(
            padding: !isFocused
                ? EdgeInsets.all(10)
                : EdgeInsets.only(bottom: 19, left: 10, right: 10),
            margin: isShowHeader
                ? isFocused
                    ? EdgeInsets.all(0)
                    : EdgeInsets.only(left: 10, right: 10)
                : EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(isFocused ? 0 : 5)),
              border:
                  Border.all(color: isFocused ? ChColor.main : ChColor.border),
              color: ChColor.main,
            ),
            child: childAppBar)
        : SizedBox.shrink();
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  final double headerHeight;
  final String title;
  final bool enableIcon;
  bool isFocused;

  SliverHeader(
      {@required this.headerHeight,
      this.isFocused: false,
      this.title: "",
      this.enableIcon: false});

  final _iconSize = System.screenSize.width * 0.05;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ChColor.main_v1
          .withOpacity(this.isFocused ? 1 : shrinkOffset / headerHeight),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Center(
            child: Opacity(
              opacity: this.isFocused ? 1 : (shrinkOffset / headerHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  enableIcon
                      ? Image.asset('icon/ChStore_white.png',
                          height: _iconSize,
                          width: _iconSize,
                          fit: BoxFit.cover)
                      : SizedBox.shrink(),
                  Text(this.title, style: ChTextStyle.scrollHeader_v1),
                ],
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
