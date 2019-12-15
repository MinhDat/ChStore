import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppTextStyle.dart';

class SocialInfo extends StatelessWidget {
  SocialInfo(this.content, {this.bgColor, this.textColor, this.assetImage});
  final String content;
  final Widget assetImage;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          assetImage,
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(content, style: appTextStyle.social(textColor)),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
