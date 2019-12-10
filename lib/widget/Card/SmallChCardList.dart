import 'package:ChStore/utils/AppColor.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/data/Topic.dart';
import 'package:ChStore/data/Product.dart';
import 'package:ChStore/data/Category.dart';

//Template Type
const PRODUCTS_TYPE = 0;
const CATEGORIES_TYPE = 1;

class SmallChCardList extends StatefulWidget {
  SmallChCardList(this._parentContext, {this.type: PRODUCTS_TYPE});
  final BuildContext _parentContext;
  final int type;

  @override
  SmallChCardListState createState() =>
      new SmallChCardListState(_parentContext, type: this.type);
}

class SmallChCardListState extends State<SmallChCardList> {
  SmallChCardListState(this._parentContext, {this.type});

  final BuildContext _parentContext;
  final int type;
  final int firstItem = 0;
  int lastItem = allProducts.length - 1;

  GestureDetector _renderItem(
      var data,
      double itemWidth,
      double itemMediumHeight,
      double itemMaxHeight,
      bool isLeftColumn,
      int index) {
    final double leftOffset = isLeftColumn ? 20.0 : 5.0;
    final double rightOffset = isLeftColumn ? 5.0 : 20.0;

    List<Widget> nameDes = [
      Expanded(
        flex: 8,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            data.name,
            style: new TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: appColor.white,
            ),
          ),
        ),
      ),
    ];

    switch (type) {
      case CATEGORIES_TYPE:
        lastItem = allCategories.length - 1;
        break;
      case PRODUCTS_TYPE:
        nameDes.add(
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10.0),
              decoration: new BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: appColor.white,
                  ),
                ),
              ),
              child: Text(
                "\$${data.price}",
                style: new TextStyle(
                  fontSize: 12.0,
                  color: appColor.white,
                ),
              ),
            ),
          ),
        );
        break;
      default:
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          _parentContext,
          '/product-detail',
          arguments: data,
        );
      },
      child: Stack(
        children: [
          Container(
            height: ((index == firstItem && isLeftColumn) ||
                    index == lastItem && !isLeftColumn)
                ? itemMediumHeight
                : itemMaxHeight,
            width: itemWidth,
            margin: EdgeInsets.only(
              top: 10.0,
              left: leftOffset,
              right: rightOffset,
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: rightOffset,
            top: 10.0,
            left: leftOffset,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      appColor.white,
                      appColor.black,
                    ],
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: nameDes),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final RouteSettings settings = ModalRoute.of(context).settings;
    final double itemWidth = (screenSize.width - 50.0) / 2.0;
    final double itemMediumHeight = screenSize.width / 2.0;
    double itemMaxHeight = itemMediumHeight * 1.2;
    final Topic _topic = settings.arguments;
    List dataFilters = [];

    final List<GestureDetector> leftItems = <GestureDetector>[];
    final List<GestureDetector> rightItems = <GestureDetector>[];

    switch (type) {
      case CATEGORIES_TYPE:
        itemMaxHeight = itemMediumHeight;
        dataFilters = allCategories;
        break;
      case PRODUCTS_TYPE:
        dataFilters = allProducts
            .where((item) => (item.categoryId == _topic.id))
            .toList();
        break;
      default:
    }

    for (int index = 0; index < dataFilters.length; index++) {
      var data = dataFilters[index];
      // print(data.image)
      if (index % 2 == 0) {
        leftItems.add(_renderItem(
            data, itemWidth, itemMediumHeight, itemMaxHeight, true, index));
      } else {
        rightItems.add(_renderItem(
            data, itemWidth, itemMediumHeight, itemMaxHeight, false, index));
      }
    }

    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(children: leftItems),
          ),
          Expanded(
            flex: 5,
            child: Column(children: rightItems),
          ),
        ],
      )
    ]);
  }
}
