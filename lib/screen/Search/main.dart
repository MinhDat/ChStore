import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utility/ChColor.dart';
import 'package:ChStore/widget/main.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<Search> {
  ScrollController _scrollController;
  bool _isFocused;
  bool _existedWord;

  @override
  void initState() {
    super.initState();
    _isFocused = UNFOCUSED_TEXT;
    _existedWord = NOT_EXIST_WORD;
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset == HEADER_HEIGHT) {
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

  void _onFocus() {
    if (_isFocused == UNFOCUSED_TEXT) {
      _scrollController.animateTo(
        HEADER_HEIGHT,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _onUnfocused() {
    setState(() {
      _isFocused = UNFOCUSED_TEXT;
      _existedWord = NOT_EXIST_WORD;
    });
  }

  void _onChangeWord(String data) {
    if (data.length > 0 && _existedWord == NOT_EXIST_WORD) {
      setState(() {
        _existedWord = EXISTED_WORD;
      });
    }
    if (data.length == 0 && _existedWord == EXISTED_WORD) {
      setState(() {
        _existedWord = NOT_EXIST_WORD;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChColor.main,
      child: ScrollPage(
        title: "Search",
        headerAppBar: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0, bottom: 10),
          child: Text("Search", style: ChTextStyle.logo),
        ),
        childAppBar: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: SearchBox(
            isFocused: _isFocused,
            onFocus: _onFocus,
            onUnfocused: _onUnfocused,
            onChangeWord: _onChangeWord,
          ),
        ),
        isFocused: _isFocused,
        scrollController: _scrollController,
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: PopularityView()),
            _isFocused
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    top: 0,
                    left: 0,
                    child: Scaffold(
                      backgroundColor:
                          _existedWord ? ChColor.main : ChColor.foreground,
                      body: _existedWord ? SearchResult() : SizedBox.shrink(),
                    ))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
