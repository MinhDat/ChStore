import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

class Persional extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersionalState();
  }
}

class PersionalState extends State<Persional> {
  @override
  Widget build(BuildContext context) {
    double avatarSize = System.screenSize.width / 10;

    return ListView(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: AppColor.grey400,
              width: 5.0,
            ),
          )),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: avatarSize,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Text('Charlie'),
                    Text('Software Developer'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.grey400,
                width: 5.0,
              ),
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
                    bottom: BorderSide(
                      color: AppColor.grey400,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_box),
                    Text("Order Management")
                  ],
                ),
              ),
              Container(
                width: System.screenSize.width,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.grey400,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text("Setting"),
              ),
              Container(
                width: System.screenSize.width,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: new BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.grey400,
                      width: 1.0,
                    ),
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
