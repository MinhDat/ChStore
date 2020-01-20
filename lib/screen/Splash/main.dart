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
    double radiusLogo = System.screenSize.width / 9;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: AppColor.red400,
          ),
          Positioned(
            top: System.screenSize.height / 4,
            child: Container(
              width: System.screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: radiusLogo,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.greenAccent,
                      size: radiusLogo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "ChStore",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: radiusLogo / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 3 * System.screenSize.height / 4,
            child: Container(
              width: System.screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Online Shopping",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: radiusLogo / 3,
                      ),
                    ),
                  ),
                  Text(
                    "For Everyone",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: radiusLogo / 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
