import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

const RADIUS = 5.0;

class Square extends StatelessWidget {
  Square(this.imageAsset);
  final String imageAsset;

  Widget build(BuildContext context) {
    return Container(
      width: System.media.size.width / 4,
      height: System.media.size.width / 6,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.main,
        border: Border.all(color: AppColor.border, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RADIUS),
        child: Image.asset(imageAsset, fit: BoxFit.fill),
      ),
    );
  }
}
