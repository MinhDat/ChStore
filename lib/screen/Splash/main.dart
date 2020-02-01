import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ChStore/utils/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    System.firstUsage.then((first) {
      Timer(
        Duration(seconds: 5),
        () =>
            Navigator.pushReplacementNamed(context, first ? '/guide' : '/main'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    System.screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            // color: AppColor.red400,
            child: Image.asset('lib/picture/backgrounds/version_1.png',
                fit: BoxFit.cover),
          ),
          Positioned(
            top: 2 * System.screenSize.height / 3,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('icons/ChStore_white.png', height: 50, width: 50),
                Text(
                  "ChStore",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
