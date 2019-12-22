import 'package:ChStore/screen/Splash/main.dart';
import 'package:ChStore/screen/UsageGuide/main.dart';
import 'package:ChStore/screen/ProductDetail/main.dart';
import 'package:ChStore/screen/MainPage/main.dart';
import 'package:ChStore/screen/ItemCategory/main.dart';
import 'package:ChStore/utils/AppColor.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: appColor.white),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(),
        '/guide': (context) => UsageGuide(),
        '/main': (context) => Mainpage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product-detail': (context) => ProductDetail(),
        // Topic routes
        '/woman-topic': (context) => ItemCategory(),
        '/man-topic': (context) => ItemCategory(),
        '/sport-topic': (context) => ItemCategory(),
        '/animal-topic': (context) => ItemCategory(),
        '/life-topic': (context) => ItemCategory(),
        '/book-topic': (context) => ItemCategory(),
        '/travel-topic': (context) => ItemCategory(),
        '/child-topic': (context) => ItemCategory(),
        // Category routes
        '/sport-category': (context) => ItemCategory(),
        '/travel-category': (context) => ItemCategory(),
        '/music-category': (context) => ItemCategory(),
        '/gaming-category': (context) => ItemCategory(),
        '/photo-category': (context) => ItemCategory(),
        '/food-category': (context) => ItemCategory(),
      },
    ),
  );
}
