import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/Card/CardContainer.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgets = List<Widget>.generate(
      9,
      (i) => Container(
          height: 90,
          margin: EdgeInsets.only(bottom: 5),
          color: ChColor.border),
    );

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/asset/image/background/bg1_body.jpg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
            ),
            child: ListView(
              children: <Widget>[
                CardContainer(
                    label: Text("Notification", style: ChTextStyle.title),
                    child: Container(
                      child: Column(
                        children: _widgets,
                      ),
                    ))
              ],
            )));
  }
}
