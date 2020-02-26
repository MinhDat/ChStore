import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class TextSize {
  static double size14 = System.media.size.width / 14;
  static double size15 = System.media.size.width / 15;
  static double size16 = System.media.size.width / 16;
  static double size20 = System.media.size.width / 20;
  static double size22 = System.media.size.width / 22;
  static double size24 = System.media.size.width / 24;
  static double size26 = System.media.size.width / 26;
  static double size30 = System.media.size.width / 30;
  static double size33 = System.media.size.width / 33;
}

class AppColor {
  static Color primary = Color(0xFF1E975A);
  static Color primaryDart = Color(0xFF13864D);
  static Color label = Colors.white;
  static Color content = Colors.white;
  static Color title = Colors.black;
  static Color main = Colors.white;
  static Color searchBox = Color(0xFFFFFAEC);
  static Color unfocus = Colors.black54;
  static Color background = Colors.grey[200];
  static Color shadow = Colors.black38;
  static Color border = Colors.grey[200];
  static Color favorite = Colors.red;
  static Color facebook = Color(0xff3b5998);
  static Color zalo = Color(0xff0180c7);
  static Color foreground = Colors.black.withOpacity(0.5);
  static Color negative = Colors.grey[400];
  static Color link = Colors.blue;
  static Color complete = Colors.green;
  static Color initialization = Colors.grey;
  static Color popularityIcon = Color(0xFFCCCCCC);
  static Color dismiss = Colors.red[800];
  static Color activateStar = Colors.amber;
  static Color send = Colors.blue;
}

class Style {
  // Detail style
  static TextStyle detailContent =
      TextStyle(color: AppColor.content, fontSize: TextSize.size24);

  static TextStyle detailName = TextStyle(
      fontSize: TextSize.size15,
      fontWeight: FontWeight.bold,
      color: AppColor.title);

  static TextStyle detailPrice =
      TextStyle(fontSize: TextSize.size20, color: AppColor.primaryDart);

  static TextStyle detailLabel = TextStyle(
      color: AppColor.label,
      fontWeight: FontWeight.bold,
      fontSize: TextSize.size24);

  // Header style
  static TextStyle logo = TextStyle(
      fontSize: TextSize.size14,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryDart);

  static TextStyle scrollHeader = TextStyle(
      color: AppColor.primaryDart,
      fontWeight: FontWeight.bold,
      fontSize: TextSize.size26);

  static TextStyle header = TextStyle(
      color: AppColor.main,
      fontSize: TextSize.size20,
      fontWeight: FontWeight.bold);

  static TextStyle date = TextStyle(
      color: AppColor.dismiss,
      fontWeight: FontWeight.bold,
      fontSize: TextSize.size26);

  // Title card
  static TextStyle title =
      TextStyle(fontSize: TextSize.size14, fontWeight: FontWeight.bold);

  // Button Navigator
  static TextStyle button =
      TextStyle(fontSize: TextSize.size24, color: AppColor.main);

  // Product Style
  static TextStyle categoryLabel = TextStyle(
      fontSize: TextSize.size30,
      fontWeight: FontWeight.bold,
      color: AppColor.negative);

  static TextStyle productName = TextStyle(
      fontSize: TextSize.size22,
      fontWeight: FontWeight.bold,
      color: AppColor.title);

  static TextStyle productPrice = TextStyle(fontSize: TextSize.size26);

  // Counter widget style
  static TextStyle counter =
      TextStyle(fontSize: TextSize.size30, color: AppColor.primaryDart);

  // shopping cart couter style
  static TextStyle scCouter(color) => TextStyle(color: color, fontSize: 12);

  // shoping cart page style
  static TextStyle payment = TextStyle(
      color: AppColor.label,
      fontWeight: FontWeight.bold,
      fontSize: TextSize.size20);

  static TextStyle method =
      TextStyle(color: AppColor.title, fontSize: TextSize.size22);

  static TextStyle bankname =
      TextStyle(color: AppColor.label, fontSize: TextSize.size26);

  // common text style
  static TextStyle normal =
      TextStyle(color: AppColor.initialization, fontSize: TextSize.size24);

  // two card style
  static TextStyle twoCardName = TextStyle(
      fontSize: TextSize.size26,
      fontWeight: FontWeight.bold,
      color: AppColor.main);

  static TextStyle twoCardPrice =
      TextStyle(fontSize: TextSize.size33, color: AppColor.main);

  // topic style
  static TextStyle topic = TextStyle(
      fontSize: TextSize.size14,
      fontWeight: FontWeight.bold,
      color: AppColor.primary);

  // Search page style
  static TextStyle popularCategory =
      TextStyle(color: AppColor.primary, fontSize: TextSize.size22);

  static TextStyle popularTag =
      TextStyle(color: AppColor.primary, fontSize: TextSize.size20);

  // read more style
  static TextStyle link =
      TextStyle(fontSize: TextSize.size22, color: AppColor.link);

  // Search box style
  static TextStyle searchPlaceHolder =
      TextStyle(color: AppColor.initialization);

  static TextStyle cancel =
      TextStyle(fontSize: TextSize.size20, color: Colors.blueAccent);

  // not found item style
  static TextStyle noItem = TextStyle(
      color: AppColor.negative,
      fontStyle: FontStyle.italic,
      fontSize: TextSize.size20);

  // button cart color
  static TextStyle buttonCart(double textSize) =>
      TextStyle(fontSize: textSize, color: AppColor.main);

  // Profile Style
  static TextStyle jobInfo = TextStyle(color: AppColor.initialization);
  static TextStyle sociate(color) =>
      TextStyle(color: color, fontSize: TextSize.size26);

  // Notification style
  static TextStyle noticeLabel = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: TextSize.size26);

  static TextStyle noticeInfo =
      TextStyle(color: Colors.black, fontSize: TextSize.size30);
}
