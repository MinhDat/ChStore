import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

class AppTextSize {
  static double size14 = chSystem.screenSize.width / 14;
  static double size15 = chSystem.screenSize.width / 15;
  static double size16 = chSystem.screenSize.width / 16;
  static double size20 = chSystem.screenSize.width / 20;
  static double size22 = chSystem.screenSize.width / 22;
  static double size26 = chSystem.screenSize.width / 26;
  static double size28 = chSystem.screenSize.width / 28;
  static double size30 = chSystem.screenSize.width / 30;
  static double size33 = chSystem.screenSize.width / 33;
}

class AppTextStyle {
  final TextStyle header = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
  );
  final TextStyle price = TextStyle(
    fontSize: AppTextSize.size30,
  );
  final TextStyle title = TextStyle(
    fontSize: AppTextSize.size22,
    fontWeight: FontWeight.bold,
  );
  final TextStyle description = TextStyle(color: appColor.grey);
  final TextStyle text18 = TextStyle(
    fontSize: AppTextSize.size28,
    color: appColor.white,
  );
  final TextStyle text16 = TextStyle(
    fontSize: AppTextSize.size26,
    color: appColor.white,
  );
  final TextStyle cardName = TextStyle(
    fontSize: AppTextSize.size15,
    fontWeight: FontWeight.bold,
    color: appColor.white,
  );
  final TextStyle normal = TextStyle(color: appColor.black);
  final TextStyle smallCardName = TextStyle(
    fontSize: AppTextSize.size22,
    fontWeight: FontWeight.bold,
    color: appColor.white,
  );
  final TextStyle smallCardPrice =
      TextStyle(fontSize: AppTextSize.size33, color: appColor.white);
  final TextStyle logo = TextStyle(
    fontSize: AppTextSize.size16,
    fontWeight: FontWeight.bold,
    color: appColor.main,
  );
  final TextStyle scrollHeader = TextStyle(
    color: appColor.black,
    fontWeight: FontWeight.w600,
    fontSize: AppTextSize.size30,
  );
  final TextStyle topic = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
    color: appColor.main,
  );
  final TextStyle popularCategory = TextStyle(
    color: appColor.main,
    fontSize: AppTextSize.size22,
  );
  final TextStyle popularTag = TextStyle(
    color: appColor.main,
    fontSize: AppTextSize.size20,
  );
  final TextStyle categoryLabel = TextStyle(
    fontSize: AppTextSize.size30,
    fontWeight: FontWeight.bold,
    color: appColor.grey400,
  );
  final TextStyle itemName = TextStyle(
    fontSize: AppTextSize.size22,
    fontWeight: FontWeight.bold,
  );
  final TextStyle cancelButton = TextStyle(
    fontSize: AppTextSize.size26,
    color: appColor.blue,
  );
  final TextStyle searchPlaceHolder = TextStyle(
    color: appColor.grey500,
    fontSize: AppTextSize.size30,
  );
  TextStyle flexColor(color) => TextStyle(
        color: color,
        fontSize: AppTextSize.size33,
      );
}

var appTextStyle = AppTextStyle();
