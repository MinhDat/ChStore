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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: System.screenSize.width * 0.75,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'icons/ChStore.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 60,
                  child: Text("ChStore", style: AppTextStyle.logo),
                )
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
          padding: EdgeInsets.only(right: 20.0, top: 20.0),
          child: Icon(Icons.person, size: 50.0),
        )
      ],
    );
  }
}
