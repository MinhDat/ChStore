import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/ChColor.dart';
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
  bool _hasWords;

  @override
  void initState() {
    super.initState();
    _isFocused = UNFOCUSED_TEXT;
    _hasWords = NO_WORDS;
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

  void _onFocused() {
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
      _hasWords = NO_WORDS;
    });
  }

  void _onChangeWords(String data) {
    if (data.length > 0 && _hasWords == NO_WORDS) {
      setState(() {
        _hasWords = HAS_WORDS;
      });
    }
    if (data.length == 0 && _hasWords == HAS_WORDS) {
      setState(() {
        _hasWords = NO_WORDS;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChColor.main,
      child: ScrollableHeader(
        title: "Search",
        headerAppBar: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.0, bottom: 20),
          child: Text("Search", style: ChTextStyle.logo),
        ),
        childAppBar: SearchBox(
          isFocused: _isFocused,
          onFocused: _onFocused,
          onUnfocused: _onUnfocused,
          onChangeWords: _onChangeWords,
        ),
        isFocused: _isFocused,
        scrollController: _scrollController,
        child: Container(
          child: Stack(
            children: [
              PopularityView(),
              _isFocused
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      top: 0,
                      left: 0,
                      child: Scaffold(
                        backgroundColor:
                            _hasWords ? ChColor.main : ChColor.foreground,
                        body: _hasWords ? SearchResult() : SizedBox.shrink(),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
