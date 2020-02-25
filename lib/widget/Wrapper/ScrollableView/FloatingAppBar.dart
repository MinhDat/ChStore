import 'package:ChStore/utility/ChTextStyle.dart';
import 'package:ChStore/utility/System.dart';
import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  FloatingAppBar(
      {Key key,
      this.showHeader: false,
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
    return Container(
        padding:
            EdgeInsets.only(top: System.media.padding.top + 10, bottom: 10),
        width: System.media.size.width,
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
