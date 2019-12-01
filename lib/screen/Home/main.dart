import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/CustomText/TextTitle.dart';
import 'package:ChStore/widget/Item/ItemList.dart';
import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/widget/Card/ChCardPage.dart';
import 'package:ChStore/widget/Card/ChCardSlider.dart';

import 'package:ChStore/utils/AppColor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.white,
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
          ChCardPage(),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("New"),
          ),
          ChCardSlider(),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 10,
            ),
            child: TextTitle("Top trends"),
          ),
          ItemList(),
        ],
      ),
    );
  }
}
