import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget {
  String content =
      "Todo somethings. It will be integrated in some next features";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.main,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(children: [
        Icon(Icons.notifications, size: 80, color: AppColor.background),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: System.media.size.width * .55,
              child: Text("Comming soon", style: Style.noticeLabel),
            ),
            Container(
              width: System.media.size.width * .55,
              child: Text(content, style: Style.noticeInfo),
            )
          ],
        )
      ]),
    );
  }
}
