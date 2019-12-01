import 'package:flutter/material.dart';
import 'package:ChStore/widget/Profile/ProfilePainter.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double profileSize = screenSize.height / 3;
    double avatarSize = screenSize.height / 16;

    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: profileSize - 5,
              width: screenSize.width,
              child: CustomPaint(
                foregroundPainter: ProfilePainter(color: Colors.pink),
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
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
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
