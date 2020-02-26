import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;
  final Color bgColor;
  final double size;

  const Circle({Key key, this.onTap, this.icon, this.bgColor, this.size: 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: this.bgColor ?? AppColor.primary.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
