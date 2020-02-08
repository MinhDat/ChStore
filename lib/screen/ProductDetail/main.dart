import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                        height: System.screenSize.height,
                        width: System.screenSize.width,
                        child: Image.network(
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
                                  style: ChTextStyle.cardName),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10),
                              child: Text("\$${product.price}",
                                  style: ChTextStyle.cardPrice),
                            ),
                            Container(
                              key: _keySCContainer,
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color:
                                    ChColor.main.withOpacity(percentGradient),
                                border: Border(
                                  bottom: BorderSide(
                                    color: ChColor.initializationLight,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: AddToCart(
                                product,
                                size: ChTextSize.size20,
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
                              color: ChColor.initializationLight,
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
                                    style: ChTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(product.producer,
                                      style: ChTextStyle.normal),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Origin:",
                                    style: ChTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(product.origin,
                                      style: ChTextStyle.normal),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Production Date:",
                                    style: ChTextStyle.label,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                      "${product.productionDate.year}-${product.productionDate.month}-${product.productionDate.day}",
                                      style: ChTextStyle.normal),
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
                            style: ChTextStyle.normal),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: ChColor.initializationLight,
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: ChColor.initializationLight,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Rating",
                                    style: TextStyle(
                                      fontSize: System.screenSize.width / 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: RatingBar(
                                    initialRating: 0,
                                    itemSize: System.screenSize.width / 10,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            System.screenSize.width / 100),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ChColor.initializationLight,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0,
                                      right: 14.0,
                                      bottom: 5.0,
                                      top: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ChColor.initializationLight),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ChColor.initializationLight),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: 'Name',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                maxLines: 2,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ChColor.initializationLight,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ChColor.initializationLight),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ChColor.initializationLight),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: 'Write something...',
                                ),
                              ),
                            ),
                            FlatButton(
                              color: Colors.blue,
                              onPressed: () {},
                              child: Container(
                                width: System.screenSize.width,
                                child: Text(
                                  "Send",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "3.0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: System.screenSize.width / 10),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar(
                                        initialRating: 1,
                                        itemSize: System.screenSize.width / 10,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                System.screenSize.width / 100),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (double value) {},
                                      ),
                                      RatingBar(
                                        initialRating: 2,
                                        itemSize: System.screenSize.width / 10,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                System.screenSize.width / 100),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (double value) {},
                                      ),
                                      RatingBar(
                                        initialRating: 3,
                                        itemSize: System.screenSize.width / 10,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                System.screenSize.width / 100),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (double value) {},
                                      ),
                                      RatingBar(
                                        initialRating: 4,
                                        itemSize: System.screenSize.width / 10,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                System.screenSize.width / 100),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (double value) {},
                                      ),
                                      RatingBar(
                                        initialRating: 5,
                                        itemSize: System.screenSize.width / 10,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                System.screenSize.width / 100),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ChColor.initializationLight,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Name'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RatingBar(
                                  initialRating: 4,
                                  itemSize: System.screenSize.width / 30,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          System.screenSize.width / 300),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  ignoreGestures: true,
                                  onRatingUpdate: (double value) {},
                                ),
                                Text("05/02/2020"),
                              ],
                            ),
                            Text("very good")
                          ],
                        ),
                      )
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
                color: ChColor.main,
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
              color: product.favorited ? ChColor.primary : Colors.white,
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
