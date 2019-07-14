import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widgets/ItemPageView.dart';
import 'package:ChStore/widgets/HeaderView.dart';
import 'package:ChStore/widgets/ItemListView.dart';

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
  @override
  build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          HeaderView(),
          ItemPageView(context),
          ItemListView(context),
        ],
      ),
    );
  }
}
