import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final bool existedWord;
  SearchList({this.existedWord: false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      top: 0,
      left: 0,
      child: Container(
        color: existedWord ? ChColor.main : ChColor.foreground,
        child: existedWord ? SearchResult() : SizedBox.shrink(),
      ),
    );
  }
}
