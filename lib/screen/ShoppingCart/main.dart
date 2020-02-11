import 'package:flutter/material.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utility/main.dart';
import 'package:ChStore/screen/main.dart';

const BACK_ACTION = false;
const NEXT_ACTION = true;

class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  int _currentIndex;
  PageController _pageController;
  ScrollController _scrollController;
  GlobalKey<LinearProgressState> globalLinearCheckOutKey = GlobalKey();
  GlobalKey<LinearProgressState> globalLinearDoneKey = GlobalKey();
  GlobalKey<RadialProgressState> globalRadialCheckOutKey = GlobalKey();
  GlobalKey<RadialProgressState> globalRadialDoneKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = new PageController(initialPage: _currentIndex);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _scrollController.dispose();
  }

  void _changePage(action) {
    if (_pageController.hasClients &&
        (_currentIndex > 0 || action) &&
        (_currentIndex < 2 || !action)) {
      int delta = action == NEXT_ACTION ? _currentIndex + 1 : _currentIndex - 1;
      setState(() {
        _currentIndex = delta;
      });

      switch (delta) {
        case 1:
          if (action == NEXT_ACTION) {
            globalLinearCheckOutKey.currentState.reset(LINEAR_ACTIVE);
            globalRadialCheckOutKey.currentState.reset(RADIAL_ACTIVE);
          } else {
            globalLinearDoneKey.currentState.reset(LINEAR_DEACTIVE);
            globalRadialDoneKey.currentState.reset(RADIAL_DEACTIVE);
          }
          break;
        case 2:
          globalLinearDoneKey.currentState.reset(LINEAR_ACTIVE);
          globalRadialDoneKey.currentState.reset(RADIAL_ACTIVE);
          break;
        default:
          globalLinearCheckOutKey.currentState.reset(LINEAR_DEACTIVE);
          globalRadialCheckOutKey.currentState.reset(RADIAL_DEACTIVE);
          globalLinearDoneKey.currentState.reset(LINEAR_DEACTIVE);
          globalRadialDoneKey.currentState.reset(RADIAL_DEACTIVE);
      }

      _scrollController.jumpTo(0.0);
      _pageController.animateToPage(
        delta,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollHeader(
        title: "Shopping Cart",
        headerAppBar: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.0, bottom: 20),
          child: Text("Shopping Cart", style: ChTextStyle.logo),
        ),
        scrollController: _scrollController,
        childAppBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: <Widget>[
              RadialProgress(
                active: RADIAL_ACTIVE,
                child: Icon(Icons.shopping_basket, color: ChColor.complete),
              ),
              LinearProgress(key: globalLinearCheckOutKey),
              RadialProgress(
                key: globalRadialCheckOutKey,
                child: Icon(
                  Icons.attach_money,
                  color: _currentIndex > 0
                      ? ChColor.complete
                      : ChColor.initialization,
                ),
              ),
              LinearProgress(key: globalLinearDoneKey),
              RadialProgress(
                key: globalRadialDoneKey,
                child: Icon(
                  Icons.done,
                  color: _currentIndex > 1
                      ? ChColor.complete
                      : ChColor.initialization,
                ),
              ),
            ],
          ),
        ),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            ItemList(type: SHOPPING_CART_LIST_TYPE),
            CheckOut(),
            Text("Completed payment", style: ChTextStyle.normal)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ChColor.main,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 5, bottom: 10),
                child: FlatButton(
                  color: ChColor.negative,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.arrow_back, color: ChColor.main),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Back", style: ChTextStyle.button),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _changePage(BACK_ACTION);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 5, top: 10, right: 20, bottom: 10),
                child: FlatButton(
                  color: ChColor.complete,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Next", style: ChTextStyle.button),
                      ),
                      Icon(Icons.arrow_forward, color: ChColor.main),
                    ],
                  ),
                  onPressed: () {
                    _changePage(NEXT_ACTION);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
