import 'package:ChStore/provider/Provider.dart';
import 'package:ChStore/screen/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ChStore/bloc/Bloc.dart';
import 'package:ChStore/utils/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(
    //       statusBarColor: Colors.black, // Color for Android
    //       statusBarBrightness:
    //           Brightness.light // Dark == white status bar -- for IOS.
    //       ),
    // );
    BlocSupervisor.delegate = SimpleBlocDelegate();

    return DataProvider(
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(primaryColor: AppColor.white),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => SplashScreen(),
          '/guide': (context) => UsageGuide(),
          '/main': (context) => Mainpage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
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
        },
      ),
    );
  }
}
