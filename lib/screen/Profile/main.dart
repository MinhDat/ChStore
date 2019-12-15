import 'package:flutter/material.dart';

import 'package:ChStore/screen/Profile/Wallpaper.dart';
import 'package:ChStore/widget/Button/SocialInfo.dart';

import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:ChStore/utils/AppColor.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double profileSize = screenSize.height / 3;
    double avatarSize = screenSize.height / 16;
    double panelSize = 4 * profileSize / 5;
    double analyticSize = profileSize / 4;
    double activeSize = screenSize.height;

    return Container(
      color: appColor.grey200,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Wallpaper(
              height: profileSize - 5,
              width: screenSize.width,
            ),
          ),
          Positioned(
            top: profileSize / 3,
            right: 0,
            child: Container(
              height: screenSize.height - (profileSize / 2),
              width: screenSize.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: panelSize,
                        ),
                        Positioned(
                          top: avatarSize,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(top: avatarSize),
                            decoration: new BoxDecoration(
                              color: appColor.white,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Text("Charlie", style: appTextStyle.title),
                                Text("Software Developer",
                                    style: appTextStyle.description),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 10),
                                        child: SocialInfo(
                                          "Facebook",
                                          bgColor: appColor.facebook,
                                          textColor: appColor.white,
                                          assetImage: Image.asset(
                                            'icons/facebook_white.png',
                                            height: 22,
                                            width: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 20),
                                        child: SocialInfo(
                                          "Zalo",
                                          bgColor: appColor.zalo,
                                          textColor: appColor.white,
                                          assetImage: Image.asset(
                                            'icons/zalo.png',
                                            height: 27,
                                            width: 27,
                                            color: appColor.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: ((screenSize.width - 60) / 2) - avatarSize,
                          child: CircleAvatar(
                            radius: avatarSize,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Container(
                      height: analyticSize,
                      decoration: new BoxDecoration(
                        color: appColor.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: appTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: appTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: appTextStyle.normal),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Container(
                      height: activeSize,
                      decoration: new BoxDecoration(
                        color: appColor.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      // child: ,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
