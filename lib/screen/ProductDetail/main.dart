import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:ChStore/widget/Button/CircleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:ChStore/data/Product.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<ProductDetail> {
  Product product;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    setState(() {
      product = settings.arguments;
    });

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: System.screenSize.height,
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: System.screenSize.height,
                        width: System.screenSize.width,
                        // Add box decoration
                        decoration: BoxDecoration(
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.white10.withOpacity(0),
                              Colors.white12,
                              Colors.white24,
                              Colors.white60,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          children: <Widget>[
                            Text(product.name, style: AppTextStyle.cardName),
                            Text("\$${product.price}",
                                style: AppTextStyle.cardPrice),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child:
                        Text(product.description, style: AppTextStyle.normal),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: System.screenSize.width / 10,
            right: System.screenSize.width / 12,
            child: CircleButton(
              icon: Icon(
                Icons.close,
                color: AppColor.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
