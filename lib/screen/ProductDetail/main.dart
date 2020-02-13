import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';

import 'package:flutter/material.dart';

import 'Comment.dart';
import 'Ratting.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductDetailState();
  }
}

class _ProductDetailState extends State<ProductDetail> {
  Product _product;
  GlobalKey _keySCContainer = GlobalKey();
  Size _sizeSCContainer;
  ScrollController _scrollController;
  double percentGradient = 0;

  @override
  void initState() {
    super.initState();
    // Listen completed render event
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset < 0) {
          setState(() {
            percentGradient = 0.0;
          });
        } else if (_scrollController.offset <= _sizeSCContainer.height) {
          setState(() {
            percentGradient =
                _scrollController.offset / _sizeSCContainer.height;
          });
        } else if (_scrollController.offset > _sizeSCContainer.height) {
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
      _product.favorited = !_product.favorited;
    });
  }

  _onBuildCompleted(_) {
    _getSize();
  }

  _getSize() {
    final RenderBox renderBoxRed =
        _keySCContainer.currentContext.findRenderObject();
    setState(() {
      _sizeSCContainer = renderBoxRed.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    setState(() {
      _product = settings.arguments;
    });

    return Scaffold(
      backgroundColor: ChColor.main,
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
                        height: System.screenSize.height * 0.8,
                        width: System.screenSize.width,
                        color: ChColor.primary_v1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40)),
                          child: Image.network(
                            _product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: System.screenSize.height * 0.8,
                        width: System.screenSize.width,
                        // Add box decoration
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40)),
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.white70,
                              Colors.white60,
                              Colors.white12,
                              Colors.white10.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Text(_product.name,
                                  style: ChTextStyle.cardName_v1),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10),
                              child: Text("\$${_product.price}",
                                  style: ChTextStyle.cardPrice_v1),
                            ),
                            // Container(
                            //   key: _keySCContainer,
                            //   padding: EdgeInsets.only(
                            //       left: 20, right: 20, top: 10, bottom: 10),
                            //   decoration: BoxDecoration(
                            //     color:
                            //         ChColor.main.withOpacity(percentGradient),
                            //     border: Border(
                            //       bottom: BorderSide(
                            //           color: ChColor.border, width: 2.0),
                            //     ),
                            //   ),
                            //   child:
                            //       AddToCart(_product, size: ChTextSize.size20),
                            // ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Circle(
                          size: 50,
                          bgColor: ChColor.primary_v1_dart,
                          icon: Icon(Icons.add_shopping_cart,
                              color: ChColor.main),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: ChColor.primary_v1,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ChColor.border, width: 1.0)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Text("Producer:",
                                        style: ChTextStyle.label_v1),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(_product.producer,
                                        style: ChTextStyle.content_v1),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Text("Origin:",
                                        style: ChTextStyle.label_v1),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(_product.origin,
                                        style: ChTextStyle.content_v1),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Text("Production Date:",
                                        style: ChTextStyle.label_v1),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                        "${_product.productionDate.year}-${_product.productionDate.month}-${_product.productionDate.day}",
                                        style: ChTextStyle.content_v1),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: ChColor.primary_v1,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(_product.description,
                              style: ChTextStyle.content_v1),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: ChColor.primary_v1,
                            border: Border(
                              top:
                                  BorderSide(color: ChColor.border, width: 1.0),
                              bottom:
                                  BorderSide(color: ChColor.border, width: 1.0),
                            ),
                          ),
                          child: Ratting(),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: ChColor.primary_v1,
                            border: Border(
                              bottom: BorderSide(
                                color: ChColor.border,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Comment(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Circle(
              bgColor: ChColor.primary_v1_dart,
              icon: Icon(Icons.close, color: ChColor.main),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkResponse(
              onTap: () {
                _favoriteHandle();
              },
              child: Icon(
                Icons.favorite,
                size: 35,
                color: _product.favorited ? ChColor.primary : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
