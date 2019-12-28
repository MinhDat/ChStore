import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;

  const CircleButton({Key key, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 30.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: AppColor.main.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
