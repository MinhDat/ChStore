import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/Wallpaper/ProfilePainter.dart';

import 'package:flutter/material.dart';

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
        foregroundPainter: ProfilePainter(color: ChColor.primary),
      ),
    );
  }
}
