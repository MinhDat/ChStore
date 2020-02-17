import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

import 'AppBarHeader.dart';
import 'AppBarChild.dart';

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
            image: AssetImage("lib/asset/image/background/bg1_body.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: SafeArea(
        child: NestedScrollView(
          controller: scrollController ?? ScrollController(),
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) =>
              <Widget>[
            SliverPersistentHeader(
              delegate: AppBarHeader(
                  headerHeight: HEADER_HEIGHT,
                  isFocused: isFocused,
                  title: title,
                  enableIcon: enableIcon),
              pinned: true,
            ),
            SliverAppBar(
              backgroundColor: ChColor.main.withOpacity(0),
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
                  AppBarChild(
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
