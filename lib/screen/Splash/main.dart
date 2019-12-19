import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamed(
        context,
        '/main',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double radiusLogo = screenSize.width / 9;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: appColor.red400,
          ),
          Positioned(
            top: screenSize.height / 4,
            child: Container(
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: appColor.white,
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
                        color: appColor.white,
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
            top: 3 * screenSize.height / 4,
            child: Container(
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Online Shopping",
                      style: TextStyle(
                        color: appColor.white,
                        fontSize: radiusLogo / 3,
                      ),
                    ),
                  ),
                  Text(
                    "For Everyone",
                    style: TextStyle(
                      color: appColor.white,
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
