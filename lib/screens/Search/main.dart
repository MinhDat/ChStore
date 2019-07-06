import 'package:flutter/material.dart';

import '../../widgets/HeaderView.dart';
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
  ScrollController _scrollController;
  double cWidth;
  double itemHeight;
  double itemsCount;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(onScroll);
  }

  onScroll() {
    setState(() {
      print('offset ${_scrollController.offset}');
      cWidth = _scrollController.offset *
          MediaQuery.of(context).size.width /
          (itemHeight * itemsCount);
    });
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      // controller: _scrollController,
      children: [
        HeaderView(),
        SearchBarView(),
      ],
    );
  }
}
