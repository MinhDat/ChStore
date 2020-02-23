import 'package:ChStore/screen/HomePage/BLoCRenderItem.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/ScrollableView/Constant.dart';
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
  bool _hasFocused = HAS_NOT_FOCUSED;
  bool _showHeader = false;
  final _iconSize = System.media.size.width * 0.05;
  GlobalKey _identityKey = GlobalKey();
  double _floatingAppBarTop = 0;

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

      setState(() {
        _showHeader = FLOATING_APP_BAR_TOP - _scrollController.offset <=
            System.media.padding.top;
      });
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
    return ScrollableView(
      controller: _scrollController,
      floatingAppBar: FloatingAppBar(
        showHeader: _showHeader,
        header: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('icon/logo.png',
                height: _iconSize, width: _iconSize, fit: BoxFit.cover),
            Text("ChStore", style: ChTextStyle.scrollHeader),
          ],
        ),
        identify: Padding(
          key: _identityKey,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Header(),
        ),
        appBar: Container(
          padding: EdgeInsets.all(10),
          margin: _focused
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_focused ? 0 : 5)),
            border: Border.all(color: _focused ? ChColor.main : ChColor.border),
            color: ChColor.main,
          ),
          child: SearchBox(
            focused: _focused,
            onFocus: _onFocus,
            onUnfocused: _onUnfocused,
            onChangeWord: _onChangeWord,
          ),
        ),
      ),
      child: Stack(
        children: [
          ListView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            children: [BLoCRenderItem()],
          ),
          _focused ? SearchList(existedWord: _existedWord) : SizedBox.shrink(),
        ],
      ),
    );
  }

  // After rendered
  void _onBuildCompleted(_) {
    final RenderBox renderBox = _identityKey.currentContext.findRenderObject();
    setState(() {
      _floatingAppBarTop = renderBox.size.height;
    });
  }
}
