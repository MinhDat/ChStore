import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ChStore/utility/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    System.firstUsage.then((first) {
      _timer = Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
              context, first ? '/guide' : '/main'));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null && _timer.isActive) _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    System.media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColor.main,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.asset('lib/asset/image/background/bg1.jpg',
                fit: BoxFit.fitWidth, alignment: Alignment.center),
          ),
          Positioned(
            top: System.media.size.height / 7,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('icon/logo.png', height: 50, width: 50),
                Text(
                  "ChStore",
                  style: TextStyle(
                      color: AppColor.primaryDart,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
