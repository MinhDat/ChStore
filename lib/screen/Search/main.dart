import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

import 'SearchPage.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<Search> {
  ScrollController _scrollController;
  bool _isFocused = UNFOCUSED_TEXT;
  bool _existedWord = NOT_EXIST_WORD;
  bool _isShowHeader = SHOW_HEADER;
  bool _hasFocused = HAS_NOT_FOCUSED;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        // Focused in search box
        if (_hasFocused && _scrollController.offset == HEADER_HEIGHT) {
          setState(() {
            _isFocused = FOCUSED_TEXT;
            _scrollController.jumpTo(0.0);
          });
        }

        // Checking show header
        if (!_hasFocused) {
          setState(() {
            _isShowHeader = _scrollController.offset < HEADER_HEIGHT;
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
      _hasFocused = HAS_FOCUSED;
      _isShowHeader = NOT_SHOW_HEADER;

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
      _hasFocused = HAS_NOT_FOCUSED;
      _isShowHeader = SHOW_HEADER;
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
        isShowHeader: _isShowHeader,
        childAppBar: SearchBox(
          isFocused: _isFocused,
          onFocus: _onFocus,
          onUnfocused: _onUnfocused,
          onChangeWord: _onChangeWord,
        ),
        isFocused: _isFocused,
        scrollController: _scrollController,
        child: Stack(
          children: [
            SearchPage(),
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
