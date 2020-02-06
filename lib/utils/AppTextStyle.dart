import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

class AppTextSize {
  static double size14 = System.screenSize.width / 14;
  static double size15 = System.screenSize.width / 15;
  static double size16 = System.screenSize.width / 16;
  static double size20 = System.screenSize.width / 20;
  static double size22 = System.screenSize.width / 22;
  static double size24 = System.screenSize.width / 24;
  static double size26 = System.screenSize.width / 26;
  static double size30 = System.screenSize.width / 30;
  static double size33 = System.screenSize.width / 33;
}

class AppTextStyle {
  static TextStyle header = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle logo = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
    color: AppColor.main,
  );
  static TextStyle date = TextStyle(
    color: AppColor.grey,
    fontSize: AppTextSize.size26,
  );
  static TextStyle price = TextStyle(
    fontSize: AppTextSize.size30,
  );
  static TextStyle title = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle description = TextStyle(color: AppColor.grey);
  static TextStyle button = TextStyle(
    fontSize: AppTextSize.size24,
    color: AppColor.white,
  );
  static TextStyle cardName = TextStyle(
    fontSize: AppTextSize.size15,
    fontWeight: FontWeight.bold,
    color: AppColor.main,
  );
  static TextStyle cardPrice = TextStyle(
    fontSize: AppTextSize.size20,
    color: AppColor.main,
  );
  static TextStyle cardCounter = TextStyle(
    fontSize: AppTextSize.size30,
    color: AppColor.redAccent100,
  );
  static TextStyle label = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: AppTextSize.size24,
  );
  static TextStyle normal = TextStyle(
    color: AppColor.grey,
    fontSize: AppTextSize.size24,
  );
  static TextStyle smallCardName = TextStyle(
    fontSize: AppTextSize.size26,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );
  static TextStyle smallCardPrice = TextStyle(
    fontSize: AppTextSize.size33,
    color: AppColor.white,
  );
  static TextStyle scrollHeader = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontSize: AppTextSize.size30,
  );
  static TextStyle topic = TextStyle(
    fontSize: AppTextSize.size14,
    fontWeight: FontWeight.bold,
    color: AppColor.main,
  );
  static TextStyle popularCategory = TextStyle(
    color: AppColor.main,
    fontSize: AppTextSize.size22,
  );
  static TextStyle popularTag = TextStyle(
    color: AppColor.main,
    fontSize: AppTextSize.size20,
  );
  static TextStyle categoryLabel = TextStyle(
    fontSize: AppTextSize.size30,
    fontWeight: FontWeight.bold,
    color: AppColor.grey400,
  );
  static TextStyle itemName = TextStyle(
    fontSize: AppTextSize.size22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle buttonLink = TextStyle(
    fontSize: AppTextSize.size22,
    color: AppColor.blue,
  );
  static TextStyle searchPlaceHolder = TextStyle(color: AppColor.grey500);
  static TextStyle noItem = TextStyle(
    color: AppColor.grey400,
    fontStyle: FontStyle.italic,
    fontSize: AppTextSize.size20,
  );

  static TextStyle buttonCart(double textSize) => TextStyle(
        fontSize: textSize,
        color: AppColor.white,
      );
  static TextStyle flexColor(color) => TextStyle(
        color: color,
        fontSize: AppTextSize.size33,
      );
}
