import 'package:ChStore/utils/ChColor.dart';
import 'package:ChStore/utils/ChTextStyle.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

const HEADER_HEIGHT = 40.0;
const APP_BAR_HEIGHT = 95.0;

class ScrollableHeader extends StatelessWidget {
  ScrollableHeader({
    this.title: "",
    this.isFocused: false,
    this.isShowHeader: true,
    this.scrollController,
    this.headerAppBar,
    this.childAppBar,
    @required this.child,
    this.enableIcon: false,
  });
  final String title;
  final bool isFocused;
  final bool isShowHeader;
  final Widget headerAppBar;
  final Widget childAppBar;
  final Widget child;
  final ScrollController scrollController;
  final bool enableIcon;

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
                enableIcon: enableIcon,
              ),
              pinned: true,
            ),
            SliverAppBar(
              backgroundColor: ChColor.primary,
              pinned: true,
              expandedHeight: isFocused
                  ? 0
                  : (childAppBar != null
                      ? isShowHeader
                          ? System.screenSize.width / 3
                          : APP_BAR_HEIGHT
                      : System.screenSize.width / 7.5),
              floating: !isFocused,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(isFocused
                    ? 0
                    : (childAppBar != null
                        ? isShowHeader
                            ? System.screenSize.width / 3
                            : APP_BAR_HEIGHT
                        : System.screenSize.width / 7.5)), // Add this code
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
                          height: System.screenSize.width * 0.05,
                          width: System.screenSize.width * 0.05,
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
