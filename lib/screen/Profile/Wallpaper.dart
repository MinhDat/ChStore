import 'package:flutter/material.dart';

import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/widget/Profile/ProfilePainter.dart';

class Wallpaper extends StatelessWidget {
  Wallpaper({this.height, this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
        foregroundPainter: ProfilePainter(color: AppColor.red400),
      ),
    );
  }
}
