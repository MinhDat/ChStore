import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ChStore/widget/Item/ItemList.dart';

class SearchResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  Timer _timer;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(const Duration(seconds: 1), () {
      setState(() {
        showResult = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showResult
          ? ListView(children: [ItemList()])
          : Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(),
            ),
    );
  }
}
