import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter/material.dart';

class Identity extends StatelessWidget {
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
                  padding: EdgeInsets.only(right: 5),
                  child: Image.asset('icon/logo.png',
                      height: System.media.size.width * 0.08,
                      width: System.media.size.width * 0.08,
                      fit: BoxFit.cover),
                ),
                Text("ChStore", style: ChTextStyle.logo),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "${_week[_now.weekday - 1]} ${_now.day} ${_month[_now.month - 1]}",
                style: ChTextStyle.date,
              ),
            ),
          ],
        ),
        ShoppingCart(),
      ],
    );
  }
}
