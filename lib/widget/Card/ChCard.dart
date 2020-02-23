import 'package:ChStore/utility/main.dart';
import 'package:ChStore/model/main.dart';

import 'package:flutter/material.dart';

const RADIUS_CIRCULAR = 5.0;
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
    double _itemWidth = itemWidth ?? System.media.size.width - 40;
    double _itemHeight = itemHeight ?? _itemWidth;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS_CIRCULAR)),
        color: ChColor.main,
      ),
      child: Column(children: [
        Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RADIUS_CIRCULAR),
                topRight: Radius.circular(RADIUS_CIRCULAR),
              ),
              child: Image.network(
                product.image,
                height: _itemHeight,
                width: _itemWidth,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              top: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RADIUS_CIRCULAR),
                    topRight: Radius.circular(RADIUS_CIRCULAR),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.3, 0.5, 0.7, 0.9],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.black12.withOpacity(0),
                      Colors.black12,
                      Colors.black26,
                      Colors.black38,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: _itemWidth,
          padding: EdgeInsets.all(this.type == FOR_PAGE_VIEW ? 10 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: ChTextStyle.cardName, maxLines: 2),
              Text("\$${product.price}", style: ChTextStyle.cardPrice)
            ],
          ),
        ),
      ]),
    );
  }
}
