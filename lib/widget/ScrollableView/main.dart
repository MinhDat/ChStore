import 'package:ChStore/utils/ChColor.dart';
import 'package:ChStore/utils/ChTextStyle.dart';
import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

class ScrollableHeader extends StatelessWidget {
  ScrollableHeader({
    this.title: "",
    this.isAutoScroll: false,
    this.scrollController,
    this.headerAppBar,
    this.childAppBar,
    @required this.child,
    this.enableIcon: false,
  });
  final String title;
  final bool isAutoScroll;
  final Widget headerAppBar;
  final Widget childAppBar;
  final Widget child;
  final ScrollController scrollController;
  final bool enableIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChColor.background,
      child: SafeArea(
        child: NestedScrollView(
          controller: scrollController ?? ScrollController(),
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) =>
              <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeader(
                headerHeight: 45,
                isAutoScroll: isAutoScroll,
                title: title,
                enableIcon: enableIcon,
              ),
              pinned: true,
            ),
            SliverAppBar(
              backgroundColor: ChColor.primary,
              pinned: true,
              expandedHeight:
                  isAutoScroll ? 0.0 : (childAppBar != null ? 100 : 45),
              floating: !isAutoScroll,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(isAutoScroll
                    ? 0.0
                    : (childAppBar != null ? 100 : 45)), // Add this code
                child: Container(alignment: Alignment.topLeft), // Add this code
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: <Widget>[
                      !isAutoScroll ? headerAppBar : SizedBox.shrink(),
                      childAppBar != null ? childAppBar : SizedBox.shrink(),
                    ],
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
  final bool enableIcon;
  bool isAutoScroll;

  SliverHeader(
      {@required this.headerHeight,
      this.isAutoScroll: false,
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
              opacity: this.isAutoScroll ? 1 : (shrinkOffset / headerHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  enableIcon
                      ? Image.asset('icons/ChStore_white.png',
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
