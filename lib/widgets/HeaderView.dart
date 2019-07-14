import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderContainer();
  }
}

class HeaderContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }
}

class HeaderState extends State<HeaderContainer> {
  DateTime _now = new DateTime.now();
  List<String> _month = [
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
    "MAY",
    "JUNE",
    "JULY",
    "AUGUST",
    "SEPTEMBER",
    "OCTOBER",
    "NOVEMBER",
    "DECEMBER"
  ];
  List<String> _week = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: 80,
      width: screenSize.width - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Text(
                  "${_week[_now.weekday - 1]} ${_now.day} ${_month[_now.month - 1]}",
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 20.0),
            child: Icon(Icons.person, size: 50.0),
          )
        ],
      ),
    );
  }
}
