import 'package:ChStore/utils/ChColor.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;
  final Color bgColor;

  const CircleButton({Key key, this.onTap, this.icon, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 30.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: this.bgColor ?? ChColor.primary.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
