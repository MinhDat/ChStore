import 'package:flutter/material.dart';

import 'package:ChStore/utility/main.dart';

//Template Type
const PRODUCTS_TYPE = 0;
const CATEGORIES_TYPE = 1;

const SMALL_CARD_BORDER_RADIUS = 5.0;

class SmallChCardList extends StatefulWidget {
  SmallChCardList(this._parentContext,
      {this.type: PRODUCTS_TYPE, this.dataList});
  final BuildContext _parentContext;
  final int type;
  List dataList = [];

  @override
  _SmallChCardListState createState() => _SmallChCardListState();
}

class _SmallChCardListState extends State<SmallChCardList> {
  final int firstItem = 0;

  @override
  Widget build(BuildContext context) {
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
    final double leftOffset = isLeftColumn ? 0 : 5.0;
    final double rightOffset = isLeftColumn ? 5.0 : 0;
    Widget bgImage;

    List<Widget> nameDes = [
      Expanded(
        flex: 8,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(10),
          child: Text(data.name, style: ChTextStyle.smallCardName, maxLines: 2),
        ),
      ),
    ];

    switch (widget.type) {
      case CATEGORIES_TYPE:
        bgImage = Image.asset(data.image, fit: BoxFit.cover);
        break;
      case PRODUCTS_TYPE:
        bgImage = Image.network(data.thumbnail, fit: BoxFit.cover);
        nameDes.add(
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: ChColor.main))),
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
              bottom: 10.0,
              left: leftOffset,
              right: rightOffset,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(SMALL_CARD_BORDER_RADIUS),
                child: bgImage),
          ),
          Positioned(
            bottom: 10,
            right: rightOffset,
            top: 0,
            left: leftOffset,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(SMALL_CARD_BORDER_RADIUS)),
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
