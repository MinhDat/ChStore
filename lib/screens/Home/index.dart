// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'page-view.dart';

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
  @override
  build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PageViewContainer(),
          ContactList(),
        ],
      ),
    );
  }
}
