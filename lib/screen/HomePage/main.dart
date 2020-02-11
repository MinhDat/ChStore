import 'package:ChStore/screen/HomePage/BLoCRenderItem.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _now = new DateTime.now();
  List<String> _month = [
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
  List<String> _week = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  ScrollController _scrollController;
  bool _isFocused;
  bool _existedWord;
  bool _isShowHeader;

  @override
  void initState() {
    super.initState();
    _isFocused = UNFOCUSED_TEXT;
    _existedWord = NOT_EXIST_WORD;
    _isShowHeader = true;
    _scrollController = ScrollController()
      ..addListener(() {
        // Focused in search box
        if (_scrollController.offset == HEADER_HEIGHT) {
          setState(() {
            _isFocused = FOCUSED_TEXT;
            _scrollController.jumpTo(0.0);
          });
        }
        // Checking show header
        setState(() {
          _isShowHeader = _scrollController.offset < HEADER_HEIGHT;
        });
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
    return ScrollHeader(
      title: "ChStore",
      enableIcon: true,
      headerAppBar: Header(),
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
          Positioned(
            top: 0,
            child: Wallpaper(
              height: System.screenSize.height / 3,
              width: System.screenSize.width,
            ),
          ),
          ListView(children: [BLoCRenderItem()]),
          _isFocused
              ? SearchList(existedWord: _existedWord)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
