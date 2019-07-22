import 'package:flutter/material.dart';
import 'package:ChStore/widgets/SearchBarView.dart';
import 'package:ChStore/widgets/PopularityView.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchContainer();
  }
}

class SearchContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<SearchContainer> with WidgetsBindingObserver {
  ScrollController _scrollController;
  bool _isFocused;

  @override
  void initState() {
    super.initState();
    _isFocused = UNFOCUSED_TEXT;
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset == 40.0) {
          setState(() {
            _isFocused = FOCUSED_TEXT;
            _scrollController.jumpTo(0.0);
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onFocused() {
    if (_isFocused == UNFOCUSED_TEXT) {
      _scrollController.animateTo(
        40.0,
        duration: Duration(milliseconds: 700),
        curve: Curves.ease,
      );
    }
  }

  void _onUnfocused() {
    setState(() {
      _isFocused = UNFOCUSED_TEXT;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeader(headerHeight: 40, isFocused: _isFocused),
              pinned: true,
            ),
            SliverAppBar(
              pinned: true,
              expandedHeight: _isFocused ? 0.0 : 95.0,
              floating: !_isFocused,
              bottom: PreferredSize(
                // Add this code
                preferredSize:
                    Size.fromHeight(_isFocused ? 0.0 : 95.0), // Add this code
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(""),
                ), // Add this code
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: <Widget>[
                      !_isFocused
                          ? Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : null,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SearchBarView(
                          isFocused: _isFocused,
                          onFocused: _onFocused,
                          onUnfocused: _onUnfocused,
                        ),
                      ),
                    ].where((f) => f != null).toList(),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: PopularityView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  final double headerHeight;
  bool isFocused;

  SliverHeader({@required this.headerHeight, this.isFocused});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Center(
            child: Opacity(
              opacity: this.isFocused ? 1 : (shrinkOffset / headerHeight),
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.black,
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
