import 'package:ChStore/screen/HomePage/BLoCRenderItem.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime _now = new DateTime.now();
  final List<String> _month = [
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
    "MAY",
    "JUNE",
    "JULY",
    "AUGUST",
    "SEPTEMBER",
    "OCTOBER",
    "NOVEMBER",
    "DECEMBER"
  ];
  final List<String> _week = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isFocused = UNFOCUSED_TEXT;
  bool _existedWord = NOT_EXIST_WORD;
  bool _isShowHeader = SHOW_HEADER;
  bool _hasFocused = HAS_NOT_FOCUSED;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
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
    return ScrollPage(
      title: "ChStore",
      enableIcon: true,
      headerAppBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10), child: Header()),
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
          ListView(children: [BLoCRenderItem()]),
          _isFocused
              ? SearchList(existedWord: _existedWord)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
