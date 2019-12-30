import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/Item/ItemList.dart';
import 'package:ChStore/widget/Header/main.dart';
import 'package:ChStore/widget/Card/ChCardPage.dart';
import 'package:ChStore/widget/Card/ChCardSlider.dart';
import 'package:ChStore/widget/Item/FourCircleItem.dart';

import 'package:ChStore/utils/AppColor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: ListView(
        children: [
          Header(),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text("Today", style: AppTextStyle.title),
          ),
          ChCardPage(),
          FourCircleItem(),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Text("News", style: AppTextStyle.title),
          ),
          ChCardSlider(),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Stack(
              children: [
                Text("Top trends", style: AppTextStyle.title),
                Positioned(
                  right: 20,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text("See All", style: AppTextStyle.buttonLink),
                  ),
                )
              ],
            ),
          ),
          ItemList(),
        ],
      ),
    );
  }
}
