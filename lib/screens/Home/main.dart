// import 'dart:async';
import 'package:demo/widgets/ItemPageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/HeaderView.dart';
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
  // DateTime _now = new DateTime.now();
  // List<String> _month = [
  //   "JANUARY",
  //   "FEBRUARY",
  //   "MARCH",
  //   "APRIL",
  //   "MAY",
  //   "JUNE",
  //   "JULY",
  //   "AUGUST",
  //   "SEPTEMBER",
  //   "OCTOBER",
  //   "NOVEMBER",
  //   "DECEMBER"
  // ];
  // List<String> _week = [
  //   "MONDAY",
  //   "TUESDAY",
  //   "WEDNESDAY",
  //   "THURSDAY",
  //   "FRIDAY",
  //   "SATURDAY",
  //   "SUNDAY"
  // ];

  @override
  build(BuildContext context) {
    return ListView(
      children: [
        HeaderView(),
        ItemPageView(context),
        ItemListView(context),
      ],
    );
  }
}
