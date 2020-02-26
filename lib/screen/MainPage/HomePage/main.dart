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
  final _iconSize = System.media.size.width * 0.05;
  bool _focus = HAS_NOT_FOCUSED;
  bool _existedWord = NOT_EXIST_WORD;
  bool _showHeader = NOT_SHOW_HEADER;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Focused in search box
      if (_focus == HAS_FOCUSED && _existedWord == NOT_EXIST_WORD) {
        setState(() {
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
    if (_focus == HAS_NOT_FOCUSED) {
      _focus = HAS_FOCUSED;
      _scrollController.animateTo(System.media.padding.top,
          duration: Duration(seconds: 1), curve: Curves.ease);
    }
  }

  void _onUnfocused() {
    setState(() {
      _focus = HAS_NOT_FOCUSED;
      _existedWord = NOT_EXIST_WORD;
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
      focus: _focus,
      floatingAppBar: FloatingAppBar(
        showHeader: _showHeader || _focus,
        header: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('icon/logo.png',
                height: _iconSize, width: _iconSize, fit: BoxFit.cover),
            Text("ChStore", style: Style.scrollHeader),
          ],
        ),
        identify: Padding(
            padding: EdgeInsets.only(left: 10, right: 10), child: Identity()),
        appBar: AppBarWrapper(
          focus: _focus,
          showHeader: _showHeader,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SearchBox(
                  focus: _focus,
                  onFocus: _onFocus,
                  onUnfocused: _onUnfocused,
                  onChangeWord: _onChangeWord,
                ),
              ),
              !_focus && _showHeader
                  ? Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerRight, child: ShowCart()))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      child: ListView(controller: _scrollController, children: [
        Container(
          margin: EdgeInsets.only(top: _focus ? 0 : 10),
          color: AppColor.foreground.withOpacity(0.1),
          child: SearchResult(
            focus: _focus,
            existedWord: _existedWord,
            child: BLoCRenderItem(),
          ),
        ),
      ]),
    );
  }
}
