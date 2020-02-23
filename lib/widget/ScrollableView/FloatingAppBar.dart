import 'package:ChStore/utility/ChTextStyle.dart';
import 'package:ChStore/utility/System.dart';
import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  FloatingAppBar(
      {Key key,
      this.showHeader: true,
      this.header: const SizedBox.shrink(),
      this.identify: const SizedBox.shrink(),
      this.appBar: const SizedBox.shrink()})
      : super(key: key);
  final Widget header;
  final Widget identify;
  final Widget appBar;
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(
            top: showHeader ? System.media.padding.top : 10, bottom: 10),
        width: _screenSize.width,
        decoration: BoxDecoration(
          color: ChColor.main.withOpacity(showHeader ? 1 : 0),
          border: Border(
              bottom: BorderSide(
                  color: ChColor.border.withOpacity(showHeader ? 1 : 0))),
        ),
        child: Column(
          children: [
            showHeader ? header : identify,
            appBar,
          ],
        ));
  }
}
