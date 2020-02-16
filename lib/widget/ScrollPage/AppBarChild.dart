import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class AppBarChild extends StatelessWidget {
  final bool isFocused;
  final bool isShowHeader;
  final Widget childAppBar;

  AppBarChild({
    this.isFocused: false,
    this.isShowHeader: true,
    @required this.childAppBar,
  });
  @override
  Widget build(BuildContext context) {
    return childAppBar != null
        ? Container(
            padding: !isFocused
                ? EdgeInsets.all(10)
                : EdgeInsets.only(bottom: 19, left: 10, right: 10),
            margin: isShowHeader
                ? isFocused
                    ? EdgeInsets.all(0)
                    : EdgeInsets.only(left: 10, right: 10)
                : EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(isFocused ? 0 : 5)),
              border:
                  Border.all(color: isFocused ? ChColor.main : ChColor.border),
              color: ChColor.main,
            ),
            child: childAppBar)
        : SizedBox.shrink();
  }
}
