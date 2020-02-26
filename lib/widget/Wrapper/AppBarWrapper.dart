import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget//main.dart';
import 'package:flutter/material.dart';

class AppBarWrapper extends StatelessWidget {
  AppBarWrapper(
      {this.focus: HAS_NOT_FOCUSED,
      this.showHeader: NOT_SHOW_HEADER,
      this.child});
  final Widget child;
  final bool focus;
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: focus || showHeader
          ? EdgeInsets.all(0)
          : EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: AppColor.border.withOpacity(focus || showHeader ? 0 : 1)),
          color: AppColor.main),
      child: child,
    );
  }
}
