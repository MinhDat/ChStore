import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/widget/Header/ScrollHeader.dart';
import 'package:ChStore/widget/Item/ItemList.dart';
import 'package:ChStore/widget/Button/Progress/RadialProgress.dart';
import 'package:ChStore/widget/Button/Progress/LinearProgress.dart';
import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/screen/CheckOut/main.dart';

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
        scrollController: _scrollController,
        childAppBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RadialProgress(
                active: RADIAL_ACTIVE,
                child: Icon(
                  Icons.shopping_basket,
                  color: appColor.red300,
                ),
              ),
              LinearProgress(key: globalLinearCheckOutKey),
              RadialProgress(
                key: globalRadialCheckOutKey,
                child: Icon(
                  Icons.attach_money,
                  color: _currentIndex > 0 ? appColor.red300 : appColor.grey,
                ),
              ),
              LinearProgress(key: globalLinearDoneKey),
              RadialProgress(
                key: globalRadialDoneKey,
                child: Icon(
                  Icons.done,
                  color: _currentIndex > 1 ? appColor.red300 : appColor.grey,
                ),
              ),
            ],
          ),
        ),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            ListView(children: [ItemList(type: SHOPPING_CART_LIST_TYPE)]),
            CheckOut(),
            Text("Completed payment", style: appTextStyle.normal)
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: FlatButton(
              color: appColor.grey400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: appColor.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Back", style: appTextStyle.text18),
                  ),
                ],
              ),
              onPressed: () {
                _changePage(BACK_ACTION);
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: FlatButton(
              color: appColor.redAccent100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Next", style: appTextStyle.text18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: appColor.white,
                  ),
                ],
              ),
              onPressed: () {
                _changePage(NEXT_ACTION);
              },
            ),
          ),
        ],
      ),
    );
  }
}
