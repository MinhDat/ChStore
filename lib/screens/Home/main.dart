import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widgets/TextView/TextTitle.dart';

import 'package:ChStore/widgets/ItemPageView.dart';
import 'package:ChStore/widgets/HeaderView.dart';
import 'package:ChStore/widgets/ItemListView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          HeaderView(),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("Today"),
          ),
          ItemPageView(context),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("Top trends"),
          ),
          ItemListView(context),
        ],
      ),
    );
  }
}
