import 'package:ChStore/utils/ChTextStyle.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/model/main.dart';

const RADIUS_CIRCULAR = 20.0;
// Templates
const NONE = 0;
const FOR_PAGE_VIEW = 1;
const FOR_SLIDER = 2;

class ChCard extends StatelessWidget {
  ChCard(this.product, {this.itemHeight, this.itemWidth, this.type = NONE});
  final Product product;
  final int type;
  final double itemHeight, itemWidth;

  @override
  Widget build(BuildContext context) {
    double _itemWidth = itemWidth ?? System.screenSize.width - 40;
    double _itemHeight = itemHeight ?? _itemWidth * 1.2;

    List<Widget> widgetList = [
      ClipRRect(
        borderRadius: new BorderRadius.circular(RADIUS_CIRCULAR),
        child: Image.network(
          product.image,
          height: _itemHeight,
          width: _itemWidth,
          fit: BoxFit.cover,
        ),
      )
    ];

    switch (type) {
      case FOR_PAGE_VIEW:
        widgetList.add(
          Positioned(
            bottom: 0,
            right: 0,
            top: 0,
            left: 0,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(RADIUS_CIRCULAR),
                  bottomRight: Radius.circular(RADIUS_CIRCULAR),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.white10.withOpacity(0),
                    Colors.white12,
                    Colors.white54,
                    Colors.white70,
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case FOR_SLIDER:
        break;
      default:
    }

    widgetList.add(
      Positioned(
        bottom: type == FOR_SLIDER ? 10 : 30,
        left: 10,
        right: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: ChTextStyle.cardName, maxLines: 2),
            Text("\$${product.price}", style: ChTextStyle.cardPrice)
          ],
        ),
      ),
    );

    return Container(
      child: Stack(
        children: widgetList,
      ),
    );
  }
}
