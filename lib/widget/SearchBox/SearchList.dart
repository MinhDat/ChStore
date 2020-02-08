import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final bool hasWords;
  SearchList({this.hasWords: false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      top: 0,
      left: 0,
      child: Scaffold(
        backgroundColor: hasWords ? ChColor.main : ChColor.foreground,
        body: hasWords ? SearchResult() : null,
      ),
    );
  }
}
