import 'package:ChStore/bloc/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Focus Type
const UNFOCUSED_TEXT = false;
const FOCUSED_TEXT = true;
//Change Type
const NOT_EXIST_WORD = false;
const EXISTED_WORD = true;

class SearchBox extends StatelessWidget {
  SearchBox({
    this.focused: false,
    this.showCart: false,
    this.onFocus,
    this.onUnfocused,
    this.onChangeWord,
  });
  final bool focused;
  final bool showCart;
  final FocusedCalback onFocus;
  final UnfocusedCalback onUnfocused;
  final ChangeWordsCalback onChangeWord;

  void _handleCancel() {
    onUnfocused();
  }

  void _handleTap() {
    onFocus();
  }

  void _handleChange(data) {
    onChangeWord(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 35.0,
      margin: const EdgeInsets.only(top: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: focused || showCart ? 8 : 10,
            child: focused
                ? TextField(
                    autofocus: true,
                    onChanged: (data) {
                      _handleChange(data);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ChColor.searchBox,
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
                    onTap: () => _handleTap(),
                    child: Container(
                      height: 35.0,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 11.0),
                      decoration: BoxDecoration(
                        color: ChColor.searchBox,
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
          (focused
              ? Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => _handleCancel(),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.centerRight,
                      child: Text("Cancel", style: ChTextStyle.cancel),
                    ),
                  ),
                )
              : showCart
                  ? Expanded(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: ShoppingCart()))
                  : SizedBox.shrink()),
        ],
      ),
    );
  }
}

typedef UnfocusedCalback = void Function();
typedef FocusedCalback = void Function();
typedef ChangeWordsCalback = void Function(String);
