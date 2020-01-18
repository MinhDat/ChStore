// TODO Implement this library.
import 'package:flutter/material.dart';

import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:ChStore/utils/AppColor.dart';

import 'package:ChStore/model/Popularity.dart';

const RIGHT = true;
const LEFT = false;

class PopularityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopularCategories(),
        PopularTags(),
      ],
    );
  }
}

class PopularCategories extends StatelessWidget {
  Expanded _renderRow(data, position) {
    double marginLeft = 20;
    double marginRight = 5;
    if (position) {
      marginLeft = 5;
      marginRight = 20;
    }
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.only(
            left: marginLeft, right: marginRight, top: 5, bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F4),
          borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: <Widget>[
            Text(data.name, style: AppTextStyle.popularCategory),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xFFCCCCCC),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _popularCategories = [
      Padding(
        padding: EdgeInsets.only(left: 20, bottom: 10),
        child: Text("Popular Categories", style: AppTextStyle.title),
      )
    ];
    int index = 0;

    while (index < popularCategories.length) {
      _popularCategories.add(
        Row(
          children: <Widget>[
            _renderRow(popularCategories[index], LEFT),
            (index++ < popularCategories.length
                ? _renderRow(popularCategories[index], RIGHT)
                : null),
          ].where((f) => (f != null)).toList(),
        ),
      );
      index++;
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _popularCategories,
    );
  }
}

class PopularTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _popularTags = [
      Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Text("Popular Tags", style: AppTextStyle.title),
      )
    ];

    for (int i = 0; i < popularTags.length; i++) {
      _popularTags.add(Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: AppColor.grey500),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(popularTags[i].name, style: AppTextStyle.popularTag),
        ),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _popularTags,
    );
  }
}
