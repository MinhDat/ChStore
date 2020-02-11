import 'package:ChStore/provider/main.dart';
import 'package:ChStore/screen/main.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DataProvider(
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          // When navigating to the "/" route, build the SplashScreen widget.
          '/': (context) => SplashScreen(),
          '/guide': (context) => UsageGuide(),
          '/main': (context) => Mainpage(),
          // When navigating to the "/product-detail" route, build the ProductDetail widget.
          '/product-detail': (context) => ProductDetail(),
          // Topic routes
          '/woman-topic': (context) => Category(),
          '/man-topic': (context) => Category(),
          '/sport-topic': (context) => Category(),
          '/animal-topic': (context) => Category(),
          '/life-topic': (context) => Category(),
          '/book-topic': (context) => Category(),
          '/travel-topic': (context) => Category(),
          '/child-topic': (context) => Category(),
          // Category routes
          '/sport-category': (context) => Category(),
          '/travel-category': (context) => Category(),
          '/music-category': (context) => Category(),
          '/gaming-category': (context) => Category(),
          '/photo-category': (context) => Category(),
          '/food-category': (context) => Category(),
          // Products route
          '/product-list': (context) => ProductList(),
          '/profile': (context) => Profile(),
        },
      ),
    );
  }
}
