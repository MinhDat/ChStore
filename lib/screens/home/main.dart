// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/listView.dart';
import '../../widgets/pageView.dart';
import '../../data/product.dart';

class Home extends StatelessWidget {
  Home(this._parentContext, this.allProducts);
  final BuildContext _parentContext;
  final List<Product> allProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Welcome to Home places',
      // theme: ThemeData(primaryColor: Colors.white),
      body: HorizontalList(_parentContext, allProducts),
    );
  }
}

class HorizontalList extends StatefulWidget {
  HorizontalList(this._parentContext, this.allProducts);
  final BuildContext _parentContext;
  final List<Product> allProducts;

  @override
  State<StatefulWidget> createState() {
    return _WidgetList(_parentContext, allProducts);
  }
}

class _WidgetList extends State<HorizontalList> {
  _WidgetList(this._parentContext, this.allProducts);
  final BuildContext _parentContext;
  final List<Product> allProducts;

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
        PageViewContainer(allProducts, _parentContext),
        ListViewContainer(allProducts: allProducts),
      ],
    );
  }
}
