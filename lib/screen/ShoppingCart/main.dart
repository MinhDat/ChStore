import 'BottomNavigationShopping.dart';
import 'Payment/main.dart';

import 'package:ChStore/widget/main.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  int _currentIndex = 0;
  bool _isShowHeader = SHOW_HEADER;
  PageController _pageController;
  ScrollController _scrollController;
  GlobalKey<LinearProgressState> _globalLinearCheckOutKey = GlobalKey();
  GlobalKey<LinearProgressState> _globalLinearDoneKey = GlobalKey();
  GlobalKey<RadialProgressState> _globalRadialCheckOutKey = GlobalKey();
  GlobalKey<RadialProgressState> _globalRadialDoneKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _currentIndex);
    _scrollController = ScrollController()
      ..addListener(() {
        // Checking show header
        setState(() {
          _isShowHeader = _scrollController.offset < HEADER_HEIGHT;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _scrollController.dispose();
  }

  void _onChangePage(action) {
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
            _globalLinearCheckOutKey.currentState.reset(LINEAR_ACTIVE);
            _globalRadialCheckOutKey.currentState.reset(RADIAL_ACTIVE);
          } else {
            _globalLinearDoneKey.currentState.reset(LINEAR_DEACTIVE);
            _globalRadialDoneKey.currentState.reset(RADIAL_DEACTIVE);
          }
          break;
        case 2:
          _globalLinearDoneKey.currentState.reset(LINEAR_ACTIVE);
          _globalRadialDoneKey.currentState.reset(RADIAL_ACTIVE);
          break;
        default:
          _globalLinearCheckOutKey.currentState.reset(LINEAR_DEACTIVE);
          _globalRadialCheckOutKey.currentState.reset(RADIAL_DEACTIVE);
          _globalLinearDoneKey.currentState.reset(LINEAR_DEACTIVE);
          _globalRadialDoneKey.currentState.reset(RADIAL_DEACTIVE);
      }

      _scrollController.jumpTo(0.0);
      _pageController.animateToPage(delta,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollPage(
          title: "Shopping Cart",
          headerAppBar: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20.0, bottom: 20),
            child: Text("Shopping Cart", style: ChTextStyle.logo_v1),
          ),
          isShowHeader: _isShowHeader,
          scrollController: _scrollController,
          childAppBar: Row(
            children: <Widget>[
              RadialProgress(
                active: RADIAL_ACTIVE,
                child: Icon(Icons.shopping_basket, color: ChColor.complete),
              ),
              LinearProgress(key: _globalLinearCheckOutKey),
              RadialProgress(
                key: _globalRadialCheckOutKey,
                child: Icon(
                  Icons.attach_money,
                  color: _currentIndex > 0
                      ? ChColor.complete
                      : ChColor.initialization,
                ),
              ),
              LinearProgress(key: _globalLinearDoneKey),
              RadialProgress(
                key: _globalRadialDoneKey,
                child: Icon(
                  Icons.done,
                  color: _currentIndex > 1
                      ? ChColor.complete
                      : ChColor.initialization,
                ),
              ),
            ],
          ),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              ListView(children: [
                CardContainer(child: ItemList(type: SHOPPING_CART_LIST_TYPE))
              ]),
              CheckOut(),
              Text("Completed payment", style: ChTextStyle.normal)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationShopping(_onChangePage));
  }
}
