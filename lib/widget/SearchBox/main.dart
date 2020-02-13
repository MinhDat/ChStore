import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utility/ChColor.dart';

//Focus Type
const UNFOCUSED_TEXT = false;
const FOCUSED_TEXT = true;
//Change Type
const NOT_EXIST_WORD = false;
const EXISTED_WORD = true;

class SearchBox extends StatefulWidget {
  SearchBox({
    this.isFocused: false,
    this.onFocus,
    this.onUnfocused,
    this.onChangeWord,
  });
  final bool isFocused;
  final FocusedCalback onFocus;
  final UnfocusedCalback onUnfocused;
  final ChangeWordsCalback onChangeWord;

  @override
  State<StatefulWidget> createState() {
    return SearchBoxState();
  }
}

class SearchBoxState extends State<SearchBox> with TickerProviderStateMixin {
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
    widget.onUnfocused();
  }

  void _handleTap() {
    widget.onFocus();
  }

  void _handleChange(data) {
    widget.onChangeWord(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 35.0,
      margin: const EdgeInsets.only(top: 0.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: widget.isFocused ? 8 : 10,
            child: widget.isFocused
                ? TextField(
                    autofocus: true,
                    onChanged: (data) {
                      _handleChange(data);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ChColor.main,
                      prefixIcon: new Icon(
                        Icons.search,
                        color: ChColor.initialization,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ChColor.border),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ChColor.border),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                        color: ChColor.main,
                        border: new Border.all(color: ChColor.border),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: ChColor.initialization,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              top: 2.0,
                            ),
                            child: Text('Enter a search term',
                                style: ChTextStyle.searchPlaceHolder),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
          (widget.isFocused
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
                        alignment: Alignment.centerRight,
                        child: Text("Cancel", style: ChTextStyle.cancel),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}

typedef UnfocusedCalback = void Function();
typedef FocusedCalback = void Function();
typedef ChangeWordsCalback = void Function(String);
