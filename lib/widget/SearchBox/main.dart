import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

//Change Type
const NOT_EXIST_WORD = false;
const EXISTED_WORD = true;

class SearchBox extends StatelessWidget {
  SearchBox({
    this.focus: false,
    this.onFocus,
    this.onUnfocused,
    this.onChangeWord,
  });
  final bool focus;
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
            flex: 8,
            child: focus
                ? TextField(
                    autofocus: true,
                    onChanged: (data) {
                      _handleChange(data);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.searchBox,
                      prefixIcon: new Icon(
                        Icons.search,
                        color: AppColor.initialization,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.border),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.border),
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
                        color: AppColor.searchBox,
                        border: new Border.all(color: AppColor.border),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: AppColor.initialization,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              top: 2.0,
                            ),
                            child: Text('Enter a search term',
                                style: Style.searchPlaceHolder),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
          (focus
              ? Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => _handleCancel(),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.centerRight,
                      child: Text("Cancel", style: Style.cancel),
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
