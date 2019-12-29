import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:ChStore/widget/Button/AddToCart.dart';
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
  GlobalKey _keySCContainer = GlobalKey();
  Size sizeSCContainer;
  ScrollController _scrollController;
  double percentGradient;

  @override
  void initState() {
    super.initState();
    percentGradient = 0;
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset < 0) {
          setState(() {
            percentGradient = 0.0;
          });
        } else if (_scrollController.offset <= sizeSCContainer.height) {
          setState(() {
            percentGradient = _scrollController.offset / sizeSCContainer.height;
          });
        } else if (_scrollController.offset > sizeSCContainer.height) {
          setState(() {
            percentGradient = 1.0;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _favoriteHandle() {
    setState(() {
      product.favorited = !product.favorited;
    });
  }

  _onBuildCompleted(_) {
    _getSize();
  }

  _getSize() {
    final RenderBox renderBoxRed =
        _keySCContainer.currentContext.findRenderObject();
    setState(() {
      sizeSCContainer = renderBoxRed.size;
    });
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
            controller: _scrollController,
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
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Text(product.name,
                                  style: AppTextStyle.cardName),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10),
                              child: Text("\$${product.price}",
                                  style: AppTextStyle.cardPrice),
                            ),
                            Container(
                              key: _keySCContainer,
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color:
                                    AppColor.white.withOpacity(percentGradient),
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey200,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: AddToCart(
                                product,
                                size: AppTextSize.size20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.grey200,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Producer:",
                                    style: AppTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(product.producer,
                                      style: AppTextStyle.normal),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Origin:",
                                    style: AppTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(product.origin,
                                      style: AppTextStyle.normal),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Production Date:",
                                    style: AppTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                      "${product.productionDate.year}-${product.productionDate.month}-${product.productionDate.day}",
                                      style: AppTextStyle.normal),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20),
                        child: Text(product.description,
                            style: AppTextStyle.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: System.screenSize.width / 9,
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
          Positioned(
            top: System.screenSize.width / 12,
            left: System.screenSize.width / 12,
            child: IconButton(
              icon: Icon(Icons.favorite),
              iconSize: 35,
              color: product.favorited ? AppColor.main : Colors.white,
              onPressed: () {
                _favoriteHandle();
              },
            ),
          ),
        ],
      ),
    );
  }
}
