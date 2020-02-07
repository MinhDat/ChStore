import 'package:flutter/material.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utils/main.dart';
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
      body: ScrollableHeader(
        title: "Shopping Cart",
        headerAppBar: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.0, bottom: 20),
          child: Text("Shopping Cart", style: AppTextStyle.logo),
        ),
        scrollController: _scrollController,
        childAppBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: <Widget>[
              RadialProgress(
                active: RADIAL_ACTIVE,
                child: Icon(
                  Icons.shopping_basket,
                  color: AppColor.red300,
                ),
              ),
              LinearProgress(key: globalLinearCheckOutKey),
              RadialProgress(
                key: globalRadialCheckOutKey,
                child: Icon(
                  Icons.attach_money,
                  color: _currentIndex > 0 ? AppColor.red300 : AppColor.grey,
                ),
              ),
              LinearProgress(key: globalLinearDoneKey),
              RadialProgress(
                key: globalRadialDoneKey,
                child: Icon(
                  Icons.done,
                  color: _currentIndex > 1 ? AppColor.red300 : AppColor.grey,
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
            Text("Completed payment", style: AppTextStyle.normal)
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
              color: AppColor.grey400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Back", style: AppTextStyle.button),
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
              color: AppColor.redAccent100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Next", style: AppTextStyle.button),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.white,
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
