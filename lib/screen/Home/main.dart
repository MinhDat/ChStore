import 'package:ChStore/screen/Home/BLoCRenderItem.dart';
import 'package:ChStore/screen/main.dart';
import 'package:ChStore/widget/Header/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utils/main.dart';

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
  bool _hasWords;

  @override
  void initState() {
    super.initState();
    _isFocused = UNFOCUSED_TEXT;
    _hasWords = NO_WORDS;
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset == 40.0) {
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
        40.0,
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
    return ScrollableHeader(
      title: "ChStore",
      enableIcon: true,
      headerAppBar: Header(),
      childAppBar: SearchBox(
        isFocused: _isFocused,
        onFocused: _onFocused,
        onUnfocused: _onUnfocused,
        onChangeWords: _onChangeWords,
      ),
      isAutoScroll: _isFocused,
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
          _isFocused ? SearchList(hasWords: _hasWords) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
