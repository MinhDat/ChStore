import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  final TextStyle header =
      TextStyle(fontSize: 33.0, fontWeight: FontWeight.bold);
  final TextStyle price = TextStyle(fontSize: 15);
  final TextStyle title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle description = TextStyle(color: appColor.grey);
  final TextStyle text18 = TextStyle(fontSize: 18, color: appColor.white);
  final TextStyle text16 = TextStyle(fontSize: 16, color: appColor.white);
  final TextStyle cardName = TextStyle(
      fontSize: 30.0, fontWeight: FontWeight.bold, color: appColor.white);
  final TextStyle normal = TextStyle(color: appColor.black);
  final TextStyle smallCardName = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: appColor.white);
  final TextStyle smallCardPrice =
      TextStyle(fontSize: 12.0, color: appColor.white);
  final TextStyle logo = TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: appColor.main);
  final TextStyle scrollHeader = TextStyle(
      color: appColor.black, fontWeight: FontWeight.w600, fontSize: 16);
  final TextStyle topic = TextStyle(
      fontSize: 33.0, fontWeight: FontWeight.bold, color: appColor.main);
  final TextStyle popularCategory =
      TextStyle(color: appColor.main, fontSize: 20);
  final TextStyle popularTag = TextStyle(color: appColor.main, fontSize: 22);
  final TextStyle categoryLabel = TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.bold, color: appColor.grey400);
  final TextStyle itemName =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final TextStyle cancelButton = TextStyle(fontSize: 16, color: appColor.blue);
  final TextStyle searchPlaceHolder =
      TextStyle(color: appColor.grey500, fontSize: 16.0);
  TextStyle flexColor(color) => TextStyle(color: color, fontSize: 13);
}

var appTextStyle = AppTextStyle();
