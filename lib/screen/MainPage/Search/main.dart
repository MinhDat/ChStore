import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

import 'SearchPage.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  final ScrollController _scrollController = ScrollController();
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
        header: Text("Search", style: ChTextStyle.scrollHeader),
        identify: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0, top: 20),
          child: Text("Search", style: ChTextStyle.logo),
        ),
        appBar: AppBarWrapper(
          focus: _focus,
          showHeader: _showHeader,
          child: SearchBox(
              focus: _focus,
              onFocus: _onFocus,
              onUnfocused: _onUnfocused,
              onChangeWord: _onChangeWord),
        ),
      ),
      child: ListView(controller: _scrollController, children: [
        Container(
          color: ChColor.foreground.withOpacity(0.1),
          child: SearchResult(
            focus: _focus,
            existedWord: _existedWord,
            child: SearchPage(),
          ),
        ),
      ]),
    );
  }
}
