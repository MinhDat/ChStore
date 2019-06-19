// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/listView.dart';
import '../../components/pageView.dart';
import '../../models/product.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Home places',
      theme: ThemeData(primaryColor: Colors.white),
      home: HorizontalList(),
    );
  }
}

class HorizontalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<HorizontalList> {
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
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  _week[_now.weekday - 1] +
                      " " +
                      _now.day.toString() +
                      " " +
                      _month[_now.month - 1],
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
          PageViewContainer(allProducts),
          ListViewContainer(allProducts),
        ],
      ),
    );
  }
}

List<Product> allProducts = [
  Product(
    image: "lib/assets/picture_one.webp",
    name: "Product demo 1",
    price: "65.00",
  ),
  Product(
    image: "lib/assets/picture_two.webp",
    name: "Product demo 2",
    price: "65.00",
  ),
  Product(
    image: "lib/assets/picture_three.webp",
    name: "Product demo 3",
    price: "65.00",
  ),
  Product(
    image: "lib/assets/picture_four.webp",
    name: "Product demo 4",
    price: "65.00",
  ),
  Product(
    image: "lib/assets/picture_five.webp",
    name: "Product demo 5",
    price: "65.00",
  ),
  Product(
    image: "lib/assets/picture_six.jpg",
    name: "Product demo 6",
    price: "65.00",
  )
];
