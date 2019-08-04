import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widgets/CustomText/TextTitle.dart';
import 'package:ChStore/widgets/CustomLists/ItemList.dart';
import 'package:ChStore/widgets/Header/main.dart';
import 'package:ChStore/widgets/CustomLists/ItemPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Header(),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("Today"),
          ),
          ItemPage(context),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("Top trends"),
          ),
          ItemList(context),
        ],
      ),
    );
  }
}
