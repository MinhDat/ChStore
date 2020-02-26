import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class Personality extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalityState();
  }
}

class _PersonalityState extends State<Personality> {
  double _avatarSize = System.media.size.height / 16;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColor.background, width: 5.0),
          )),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: CircleAvatar(
                      radius: _avatarSize,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/200')),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Charlie',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Software Developer'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColor.background, width: 5.0),
            ),
          ),
          child: Row(
            children: [Icon(Icons.share), Text("Social Network Sharing")],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: AppColor.background, width: 1.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_box),
                    Text("Order Management")
                  ],
                ),
              ),
              Container(
                width: System.media.size.width,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.background, width: 1.0),
                  ),
                ),
                child: Text("Setting"),
              ),
              Container(
                width: System.media.size.width,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.background, width: 1.0),
                  ),
                ),
                child: Text("Return Order"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
