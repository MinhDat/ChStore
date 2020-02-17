import 'package:ChStore/utility/main.dart';
import 'package:ChStore/model/Popularity.dart';

import 'package:flutter/material.dart';

const RIGHT = true;
const LEFT = false;

class PopularCategories extends StatelessWidget {
  Expanded _renderRow(data, position) {
    double marginLeft = 0;
    double marginRight = 5;
    if (position) {
      marginLeft = 5;
      marginRight = 0;
    }
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.only(
            left: marginLeft, right: marginRight, top: 5, bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ChColor.background,
          borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: <Widget>[
            Text(data.name, style: ChTextStyle.popularCategory),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: ChColor.popularityIcon,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _popularCategories = [];
    int index = 0;

    while (index < popularCategories.length) {
      _popularCategories.add(
        Row(
          children: <Widget>[
            _renderRow(popularCategories[index], LEFT),
            (index++ < popularCategories.length
                ? _renderRow(popularCategories[index], RIGHT)
                : SizedBox.shrink()),
          ],
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
    List<Widget> _popularTags = [];

    for (int i = 0; i < popularTags.length; i++) {
      _popularTags.add(Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: ChColor.initialization),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(popularTags[i].name, style: ChTextStyle.popularTag),
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
