import 'package:flutter/material.dart';
import 'package:ChStore/widget/Profile/ProfilePainter.dart';

import 'package:ChStore/utils/AppColor.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double profileSize = screenSize.height / 3;
    double avatarSize = screenSize.height / 16;

    return Container(
      color: appColor.grey200,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: profileSize - 5,
              width: screenSize.width,
              child: CustomPaint(
                foregroundPainter: ProfilePainter(color: appColor.red400),
              ),
            ),
          ),
          Positioned(
            top: profileSize / 2,
            right: 0,
            child: Container(
              height: screenSize.height - (profileSize / 2),
              width: screenSize.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: profileSize,
                      decoration: new BoxDecoration(
                        color: appColor.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: FlatButton(
                              color: appColor.facebook,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'icons/facebook_white.png',
                                    height: 22,
                                    width: 22,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(
                                        color: appColor.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: FlatButton(
                              color: appColor.zalo,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'icons/zalo.png',
                                    height: 27,
                                    width: 27,
                                    color: appColor.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Zalo",
                                      style: TextStyle(
                                        color: appColor.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: (profileSize / 2) - avatarSize,
            right: (screenSize.width / 2) - avatarSize,
            child: CircleAvatar(
              radius: avatarSize,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          )
        ],
      ),
    );
  }
}
