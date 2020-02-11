import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  DateTime _now = new DateTime.now();
  List<String> _month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> _week = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 5),
                  child: Image.asset('icon/ChStore_white.png',
                      height: System.screenSize.width * 0.08,
                      width: System.screenSize.width * 0.08,
                      fit: BoxFit.cover),
                ),
                Text("ChStore", style: ChTextStyle.logo),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                "${_week[_now.weekday - 1]} ${_now.day} ${_month[_now.month - 1]}",
                style: ChTextStyle.date,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.person, size: 40.0),
        ),
      ],
    );
  }
}
