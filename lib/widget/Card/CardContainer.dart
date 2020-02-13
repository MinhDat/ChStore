import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget label;
  final Widget child;
  CardContainer({this.label, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: ChColor.main,
        margin: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
