import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

import './BLoCRenderItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _focused = UNFOCUSED_TEXT;
  bool _existedWord = NOT_EXIST_WORD;
  bool _hasFocused = HAS_NOT_FOCUSED;
  bool _showHeader = NOT_SHOW_HEADER;
  final _iconSize = System.media.size.width * 0.05;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Focused in search box
      if (_hasFocused && _focused == UNFOCUSED_TEXT) {
        setState(() {
          _focused = FOCUSED_TEXT;
          _scrollController.jumpTo(INITIAL_OFFSET);
        });
      }

      setState(() => _showHeader = _scrollController.offset > INITIAL_OFFSET);
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
      _scrollController.animateTo(
        System.media.padding.top,
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      );
    }
  }

  void _onUnfocused() {
    setState(() {
      _focused = UNFOCUSED_TEXT;
      _existedWord = NOT_EXIST_WORD;
      _hasFocused = HAS_NOT_FOCUSED;
    });
  }

  void _onChangeWord(String data) {
    if (data.length > 0 && _existedWord == NOT_EXIST_WORD) {
      setState(() => _existedWord = EXISTED_WORD);
    }
    if (data.length == 0 && _existedWord == EXISTED_WORD) {
      setState(() => _existedWord = NOT_EXIST_WORD);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableView(
      focused: !_focused,
      floatingAppBar: FloatingAppBar(
        showHeader: _showHeader || _focused,
        header: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('icon/logo.png',
                height: _iconSize, width: _iconSize, fit: BoxFit.cover),
            Text("ChStore", style: ChTextStyle.scrollHeader),
          ],
        ),
        identify: Padding(
            padding: EdgeInsets.only(left: 10, right: 10), child: Identity()),
        appBar: Container(
          padding: EdgeInsets.all(10),
          margin: _focused || _showHeader
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                  color: ChColor.border
                      .withOpacity(_focused || _showHeader ? 0 : 1)),
              color: ChColor.main),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SearchBox(
                  focused: _focused,
                  onFocus: _onFocus,
                  onUnfocused: _onUnfocused,
                  onChangeWord: _onChangeWord,
                ),
              ),
              !_focused && _showHeader
                  ? Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: ShoppingCart()))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      child: ListView(controller: _scrollController, children: [
        Container(
          margin: EdgeInsets.only(top: _focused ? 0 : 10),
          color: ChColor.foreground.withOpacity(0.1),
          child: Stack(
            children: [
              BLoCRenderItem(),
              _focused
                  ? SearchList(existedWord: _existedWord)
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ]),
    );
  }
}
