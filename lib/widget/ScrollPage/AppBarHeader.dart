import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class AppBarHeader extends SliverPersistentHeaderDelegate {
  final double headerHeight;
  final String title;
  final bool enableIcon;
  bool focused;

  AppBarHeader(
      {@required this.headerHeight,
      this.focused: false,
      this.title: "",
      this.enableIcon: false});

  final _iconSize = System.media.size.width * 0.05;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ChColor.main
          .withOpacity(this.focused ? 1 : shrinkOffset / headerHeight),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Center(
            child: Opacity(
              opacity: this.focused ? 1 : (shrinkOffset / headerHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  enableIcon
                      ? Image.asset('icon/logo.png',
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
