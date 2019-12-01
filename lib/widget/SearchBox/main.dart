import 'package:flutter/material.dart';

import 'package:ChStore/utils/AppColor.dart';

//Focus Type
const UNFOCUSED_TEXT = false;
const FOCUSED_TEXT = true;
//Change Type
const NO_WORDS = false;
const HAS_WORDS = true;

class SearchBox extends StatefulWidget {
  SearchBox({
    this.isFocused: false,
    this.onFocused,
    this.onUnfocused,
    this.onChangeWords,
  });
  final bool isFocused;
  final FocusedCalback onFocused;
  final UnfocusedCalback onUnfocused;
  final ChangeWordsCalback onChangeWords;

  @override
  State<StatefulWidget> createState() {
    return SearchBoxState(
      isFocused: isFocused,
      onFocused: onFocused,
      onUnfocused: onUnfocused,
      onChangeWords: onChangeWords,
    );
  }
}

class SearchBoxState extends State<SearchBox> with TickerProviderStateMixin {
  SearchBoxState(
      {this.isFocused, this.onFocused, this.onUnfocused, this.onChangeWords});
  bool isFocused;
  FocusedCalback onFocused;
  UnfocusedCalback onUnfocused;
  ChangeWordsCalback onChangeWords;

  AnimationController _animationController;
  CurvedAnimation _sideFinalTextAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _sideFinalTextAnimation = CurvedAnimation(
      curve: Curves.bounceInOut,
      parent: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleCancel() {
    onUnfocused();
  }

  void _handleTap() {
    onFocused();
  }

  void _handleChange(data) {
    onChangeWords(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 35.0,
      margin: const EdgeInsets.only(
          top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: isFocused ? 8 : 10,
            child: isFocused
                ? TextField(
                    autofocus: true,
                    onChanged: (data) {
                      _handleChange(data);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: appColor.grey200,
                      prefixIcon: new Icon(
                        Icons.search,
                        color: appColor.grey,
                      ),
                      // suffixIcon: new Icon(Icons.close),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(left: 14.0, top: 7.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appColor.grey200),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: appColor.grey200),
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                      hintText: 'Enter a search term',
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      _handleTap();
                    },
                    child: Container(
                      height: 35.0,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 11.0),
                      decoration: BoxDecoration(
                          border: new Border.all(color: appColor.grey200),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: appColor.grey500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              top: 2.0,
                            ),
                            child: Text(
                              'Enter a search term',
                              style: TextStyle(
                                color: appColor.grey500,
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
          (isFocused
              ? Expanded(
                  flex: 2,
                  child: SizeTransition(
                    sizeFactor: _sideFinalTextAnimation,
                    axis: Axis.horizontal,
                    axisAlignment: -1,
                    child: GestureDetector(
                      onTap: () => _handleCancel(),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          style: new TextStyle(
                            color: appColor.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null),
        ].where((filter) => filter != null).toList(),
      ),
    );
  }
}

typedef UnfocusedCalback = void Function();
typedef FocusedCalback = void Function();
typedef ChangeWordsCalback = void Function(String);
