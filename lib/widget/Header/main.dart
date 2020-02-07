import 'package:ChStore/utils/main.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
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
                  child: Image.asset('icons/ChStore_white.png',
                      height: System.screenSize.width * 0.08,
                      width: System.screenSize.width * 0.08,
                      fit: BoxFit.cover),
                ),
                Text("ChStore", style: AppTextStyle.logo),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                "${_week[_now.weekday - 1]} ${_now.day} ${_month[_now.month - 1]}",
                style: AppTextStyle.date,
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
