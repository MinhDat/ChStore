import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget label;
  final Widget child;
  final Color color;
  CardContainer({this.label, @required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: color ?? ChColor.main,
        margin: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            this.label != null
                ? Padding(
                    padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: label)
                : SizedBox.shrink(),
            Padding(padding: EdgeInsets.all(10), child: child),
          ],
        ),
      ),
    );
  }
}
