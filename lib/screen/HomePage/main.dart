import 'package:ChStore/screen/HomePage/BLoCRenderItem.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _focused = UNFOCUSED_TEXT;
  bool _existedWord = NOT_EXIST_WORD;
  bool _showHeader = SHOW_HEADER;
  bool _hasFocused = HAS_NOT_FOCUSED;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Focused in search box
      if (_hasFocused && _scrollController.offset == HEADER_HEIGHT) {
        setState(() {
          _focused = FOCUSED_TEXT;
          _scrollController.jumpTo(0.0);
        });
      }

      // Checking show header
      if (!_hasFocused) {
        setState(() {
          _showHeader = _scrollController.offset < HEADER_HEIGHT;
          System.showHeader = _showHeader;
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
    if (_focused == UNFOCUSED_TEXT) {
      _hasFocused = HAS_FOCUSED;
      _showHeader = NOT_SHOW_HEADER;
      System.showHeader = _showHeader;

      _scrollController.animateTo(
        HEADER_HEIGHT,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _onUnfocused() {
    setState(() {
      _focused = UNFOCUSED_TEXT;
      _existedWord = NOT_EXIST_WORD;
      _hasFocused = HAS_NOT_FOCUSED;
      _showHeader = SHOW_HEADER;
      System.showHeader = _showHeader;
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
    return ScrollPage(
      title: "ChStore",
      enableIcon: true,
      headerAppBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10), child: Header()),
      showHeader: _showHeader,
      childAppBar: SearchBox(
        focused: _focused,
        showCart: !_showHeader,
        onFocus: _onFocus,
        onUnfocused: _onUnfocused,
        onChangeWord: _onChangeWord,
      ),
      focused: _focused,
      scrollController: _scrollController,
      child: Stack(
        children: [
          ListView(children: [BLoCRenderItem()]),
          _focused ? SearchList(existedWord: _existedWord) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
