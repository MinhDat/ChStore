import 'package:flutter/material.dart';

// import '../../widgets/HeaderView.dart';
import '../../widgets/SearchBarView.dart';

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
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeader(headerHeight: 40),
              pinned: true,
            ),
            SliverAppBar(
              pinned: true,
              expandedHeight: 80.0,
              floating: true,
              bottom: PreferredSize(
                // Add this code
                preferredSize: Size.fromHeight(85.0), // Add this code
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(""),
                ), // Add this code
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SearchBarView(),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey[600]),
                      ),
                    ),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 0.5, color: Colors.grey[600]),
                        ),
                      ),
                      child: Text(
                        "Product demo $index",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  final double headerHeight;

  SliverHeader({@required this.headerHeight});

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
                opacity: shrinkOffset / headerHeight,
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
        ));
  }

  @override
  double get maxExtent => headerHeight;

  @override
  double get minExtent => headerHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
