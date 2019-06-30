// import 'dart:async';
import 'package:demo/widgets/ItemPageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/ItemListView.dart';
import '../../widgets/ItemPageView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageState();
  }
}

class HomePageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<HomePageState> {
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
  build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                "${_week[_now.weekday - 1]} ${_now.day} ${_month[_now.month - 1]}",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              "Today",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            )),
        ItemPageView(context),
        ItemListView(context),
      ],
    );
  }
}
