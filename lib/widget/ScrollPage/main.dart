import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

// Show header type
const SHOW_HEADER = true;
const NOT_SHOW_HEADER = true;

const HEADER_HEIGHT = 40.0;
const APP_BAR_HEIGHT = 95.0;

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

  final double _appBarMaxHeght = System.screenSize.width / 3;
  final double _appBarMinHeght = System.screenSize.width / 7.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChColor.primary,
      child: SafeArea(
        child: NestedScrollView(
          controller: scrollController ?? ScrollController(),
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
              backgroundColor: ChColor.primary,
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
                child: Container(alignment: Alignment.topLeft), // Add this code
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: <Widget>[
                      !isShowHeader
                          ? Container(height: HEADER_HEIGHT)
                          : SizedBox.shrink(),
                      isShowHeader && !isFocused
                          ? headerAppBar
                          : SizedBox.shrink(),
                      childAppBar != null ? childAppBar : SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ],
          body: Container(color: ChColor.background, child: child),
        ),
      ),
    );
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
      color: ChColor.primary,
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
                  Text(this.title, style: ChTextStyle.scrollHeader),
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
