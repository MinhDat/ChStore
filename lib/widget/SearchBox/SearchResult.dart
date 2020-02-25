import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final bool existedWord;
  final bool focus;
  final Widget child;

  SearchResult(
      {this.existedWord: NOT_EXIST_WORD,
      this.focus: HAS_NOT_FOCUSED,
      this.child: const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        !existedWord ? child : SizedBox.shrink(),
        focus
            ? Container(
                height: System.media.size.height, color: ChColor.foreground)
            : SizedBox.shrink(),
        existedWord ? SearchData() : SizedBox.shrink(),
      ],
    );
  }
}
