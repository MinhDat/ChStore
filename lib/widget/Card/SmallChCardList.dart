import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/model/main.dart';

//Template Type
const PRODUCTS_TYPE = 0;
const CATEGORIES_TYPE = 1;

class SmallChCardList extends StatefulWidget {
  SmallChCardList(this._parentContext,
      {this.type: PRODUCTS_TYPE, this.dataList});
  final BuildContext _parentContext;
  final int type;
  List dataList = [];

  @override
  _SmallChCardListState createState() => new _SmallChCardListState();
}

class _SmallChCardListState extends State<SmallChCardList> {
  final int firstItem = 0;

  @override
  Widget build(BuildContext context) {
    final RouteSettings settings = ModalRoute.of(context).settings;
    final double itemWidth = System.screenSize.width / 2.0;
    double itemMediumHeight = System.screenSize.width / 2.0;
    double itemMaxHeight = itemMediumHeight * 1.3;

    switch (widget.type) {
      case CATEGORIES_TYPE:
        itemMediumHeight = (itemMediumHeight - 30) / 1.2;
        itemMaxHeight = itemMediumHeight;
        return _renderList(
            widget.dataList, itemWidth, itemMediumHeight, itemMaxHeight);

      case PRODUCTS_TYPE:
        return _renderList(
            widget.dataList, itemWidth, itemMediumHeight, itemMaxHeight);
    }
  }

  Widget _renderList(var dataFilters, double itemWidth, double itemMediumHeight,
      double itemMaxHeight) {
    final List<GestureDetector> leftItems = <GestureDetector>[];
    final List<GestureDetector> rightItems = <GestureDetector>[];

    int lastItem = dataFilters.length - 1;
    for (int index = 0; index < dataFilters.length; index++) {
      var data = dataFilters[index];
      if (index % 2 == 0) {
        leftItems.add(_renderItem(data, itemWidth, itemMediumHeight,
            itemMaxHeight, true, index, lastItem));
      } else {
        rightItems.add(_renderItem(data, itemWidth, itemMediumHeight,
            itemMaxHeight, false, index, lastItem));
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

  GestureDetector _renderItem(
      var data,
      double itemWidth,
      double itemMediumHeight,
      double itemMaxHeight,
      bool isLeftColumn,
      int index,
      int lastItem) {
    final double leftOffset = isLeftColumn ? 20.0 : 10.0;
    final double rightOffset = isLeftColumn ? 10.0 : 20.0;
    Widget bgImage;

    List<Widget> nameDes = [
      Expanded(
        flex: 8,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text(data.name, style: ChTextStyle.smallCardName, maxLines: 3),
        ),
      ),
    ];

    switch (widget.type) {
      case CATEGORIES_TYPE:
        bgImage = Image.asset(
          data.image,
          fit: BoxFit.cover,
        );
        break;
      case PRODUCTS_TYPE:
        bgImage = Image.network(
          data.thumbnail,
          fit: BoxFit.cover,
        );
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
                    color: ChColor.main,
                  ),
                ),
              ),
              child: Text("\$${data.price}", style: ChTextStyle.smallCardPrice),
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
              child: bgImage,
            ),
          ),
          Positioned(
            bottom: 0,
            right: rightOffset,
            top: 10.0,
            left: leftOffset,
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
                    ChColor.main.withOpacity(0.3),
                    ChColor.shadow.withOpacity(0.3),
                  ],
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, children: nameDes),
            ),
          ),
        ],
      ),
    );
  }
}
