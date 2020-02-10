import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

class ChTextSize {
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

class ChTextStyle {
  static TextStyle header = TextStyle(
    color: ChColor.main,
    fontSize: ChTextSize.size24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle logo = TextStyle(
    fontSize: ChTextSize.size14,
    fontWeight: FontWeight.bold,
    color: ChColor.main,
  );
  static TextStyle date = TextStyle(
    color: ChColor.label,
    fontSize: ChTextSize.size26,
  );
  static TextStyle price = TextStyle(
    fontSize: ChTextSize.size30,
  );
  static TextStyle title = TextStyle(
    fontSize: ChTextSize.size14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle description = TextStyle(color: ChColor.initialization);
  static TextStyle button = TextStyle(
    fontSize: ChTextSize.size24,
    color: ChColor.main,
  );
  static TextStyle cardName = TextStyle(
    fontSize: ChTextSize.size15,
    fontWeight: FontWeight.bold,
    color: ChColor.primary,
  );
  static TextStyle cardPrice = TextStyle(
    fontSize: ChTextSize.size20,
    color: ChColor.primary,
  );
  static TextStyle cardCounter = TextStyle(
    fontSize: ChTextSize.size30,
    color: ChColor.primaryLight,
  );
  static TextStyle label = TextStyle(
    color: ChColor.label,
    fontWeight: FontWeight.bold,
    fontSize: ChTextSize.size24,
  );

  static TextStyle bank = TextStyle(
    color: ChColor.label,
    fontSize: ChTextSize.size26,
  );

  static TextStyle normal = TextStyle(
    color: ChColor.initialization,
    fontSize: ChTextSize.size24,
  );
  static TextStyle smallCardName = TextStyle(
    fontSize: ChTextSize.size26,
    fontWeight: FontWeight.bold,
    color: ChColor.main,
  );
  static TextStyle smallCardPrice = TextStyle(
    fontSize: ChTextSize.size33,
    color: ChColor.main,
  );
  static TextStyle scrollHeader = TextStyle(
    color: ChColor.main,
    fontWeight: FontWeight.w600,
    fontSize: ChTextSize.size26,
  );
  static TextStyle topic = TextStyle(
    fontSize: ChTextSize.size14,
    fontWeight: FontWeight.bold,
    color: ChColor.primary,
  );
  static TextStyle popularCategory = TextStyle(
    color: ChColor.primary,
    fontSize: ChTextSize.size22,
  );
  static TextStyle popularTag = TextStyle(
    color: ChColor.primary,
    fontSize: ChTextSize.size20,
  );
  static TextStyle categoryLabel = TextStyle(
    fontSize: ChTextSize.size30,
    fontWeight: FontWeight.bold,
    color: ChColor.negative,
  );
  static TextStyle itemName = TextStyle(
    fontSize: ChTextSize.size22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle link = TextStyle(
    fontSize: ChTextSize.size22,
    color: ChColor.link,
  );
  static TextStyle searchPlaceHolder = TextStyle(color: ChColor.initialization);
  static TextStyle noItem = TextStyle(
    color: ChColor.negative,
    fontStyle: FontStyle.italic,
    fontSize: ChTextSize.size20,
  );

  static TextStyle buttonCart(double textSize) => TextStyle(
        fontSize: textSize,
        color: ChColor.main,
      );
  static TextStyle flexColor(color) => TextStyle(
        color: color,
        fontSize: ChTextSize.size33,
      );
}
