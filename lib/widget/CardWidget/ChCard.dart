import 'package:flutter/material.dart';
import 'package:ChStore/data/Product.dart';

const RADIUS_CIRCULAR = 20.0;
// Templates
const NONE = 0;
const FOR_PAGE_VIEW = 1;
const FOR_SLIDER = 2;

class ChCard extends StatelessWidget {
  ChCard(this.product, {this.itemHeight, this.itemWidth, this.type = NONE});
  final Product product;
  final int type;
  double itemHeight, itemWidth;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    itemWidth = itemWidth ?? screenSize.width - 40;
    itemHeight = itemHeight ?? itemWidth * 1.2;

    List<Widget> widgetList = [
      ClipRRect(
        borderRadius: new BorderRadius.circular(RADIUS_CIRCULAR),
        child: Image.asset(
          product.image,
          height: itemHeight,
          width: itemWidth,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: 10, bottom: 10),
        height: itemHeight,
        width: itemWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "\$${product.price}",
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      )
    ];

    switch (type) {
      case FOR_PAGE_VIEW:
        widgetList.add(Positioned(
          bottom: -1.0,
          right: 0,
          top: itemHeight / 2.0,
          left: 0,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(RADIUS_CIRCULAR),
                  bottomRight: Radius.circular(RADIUS_CIRCULAR),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
        ));
        break;
      case FOR_SLIDER:
        break;
      default:
    }

    return Container(
      child: Stack(
        children: widgetList,
      ),
    );
  }
}
