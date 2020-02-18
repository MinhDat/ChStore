import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class AppBarChild extends StatelessWidget {
  final bool focused;
  final bool showHeader;
  final Widget childAppBar;

  AppBarChild({
    this.focused: false,
    this.showHeader: true,
    @required this.childAppBar,
  });
  @override
  Widget build(BuildContext context) {
    return childAppBar != null
        ? Container(
            padding: !focused
                ? EdgeInsets.all(10)
                : EdgeInsets.only(bottom: 19, left: 10, right: 10),
            margin: showHeader
                ? focused
                    ? EdgeInsets.all(0)
                    : EdgeInsets.only(left: 10, right: 10)
                : EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(focused ? 0 : 5)),
              border:
                  Border.all(color: focused ? ChColor.main : ChColor.border),
              color: ChColor.main,
            ),
            child: childAppBar)
        : SizedBox.shrink();
  }
}
