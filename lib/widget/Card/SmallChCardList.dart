import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/AppTextStyle.dart';

import 'package:ChStore/model/Product.dart';
import 'package:ChStore/model/Category.dart';
import 'package:ChStore/model/Topic.dart';

//Template Type
const PRODUCTS_TYPE = 0;
const CATEGORIES_TYPE = 1;

class SmallChCardList extends StatefulWidget {
  SmallChCardList(this._parentContext, {this.type: PRODUCTS_TYPE});
  final BuildContext _parentContext;
  final int type;

  @override
  SmallChCardListState createState() => new SmallChCardListState();
}

class SmallChCardListState extends State<SmallChCardList> {
  final int firstItem = 0;
  int lastItem = allProducts.length - 1;

  GestureDetector _renderItem(
      var data,
      double itemWidth,
      double itemMediumHeight,
      double itemMaxHeight,
      bool isLeftColumn,
      int index) {
    final double leftOffset = isLeftColumn ? 20.0 : 10.0;
    final double rightOffset = isLeftColumn ? 10.0 : 20.0;

    List<Widget> nameDes = [
      Expanded(
        flex: 8,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text(data.name, style: AppTextStyle.smallCardName),
        ),
      ),
    ];

    switch (widget.type) {
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
                    color: AppColor.white,
                  ),
                ),
              ),
              child:
                  Text("\$${data.price}", style: AppTextStyle.smallCardPrice),
            ),
          ),
        );
        break;
      default:
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          widget._parentContext,
          widget.type == CATEGORIES_TYPE
              ? '/${data.name.toLowerCase()}-category'
              : '/product-detail',
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
              top: 20.0,
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
                      AppColor.white,
                      AppColor.black,
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
    final RouteSettings settings = ModalRoute.of(context).settings;
    final double itemWidth = System.screenSize.width / 2.0;
    double itemMediumHeight = System.screenSize.width / 2.0;
    double itemMaxHeight = itemMediumHeight * 1.3;
    List dataFilters = [];

    final List<GestureDetector> leftItems = <GestureDetector>[];
    final List<GestureDetector> rightItems = <GestureDetector>[];

    switch (widget.type) {
      case CATEGORIES_TYPE:
        itemMediumHeight = (itemMediumHeight - 30) / 1.2;
        itemMaxHeight = itemMediumHeight;
        dataFilters = allCategories;
        break;
      case PRODUCTS_TYPE:
        Topic _topic = settings.arguments as Topic;
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
