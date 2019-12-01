import 'package:flutter/material.dart';

import 'package:ChStore/screen/Search/main.dart';
import 'package:ChStore/screen/Profile/main.dart';
import 'package:ChStore/screen/Home/main.dart';
import 'package:ChStore/screen/ProductCategory/main.dart';
import 'package:ChStore/screen/ProductDetail/main.dart';
import 'package:ChStore/screen/ShoppingCart/main.dart';
import 'package:ChStore/screen/ItemCategory/main.dart';

import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: appColor.white),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => new Mainpage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product-detail': (context) => new ProductDetail(),
        // Category route
        '/woman-category': (context) => new ItemCategory(),
        '/man-category': (context) => new ItemCategory(),
        '/sport-category': (context) => new ItemCategory(),
        '/animal-category': (context) => new ItemCategory(),
        '/life-category': (context) => new ItemCategory(),
        '/book-category': (context) => new ItemCategory(),
        '/travel-category': (context) => new ItemCategory(),
        '/child-category': (context) => new ItemCategory(),
      },
    ),
  );
}

class Mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetList();
  }
}

class _WidgetList extends State<Mainpage> with SingleTickerProviderStateMixin {
  int index = 0;
  //creating Key for red panel
  GlobalKey _keyShoppingCart = GlobalKey();
  AnimationController _controller;
  Offset _begin;
  Offset _end;
  Animation _offsetAnimation;
  Offset _itemCouterOffset;
  double _visibleAnimate;
  int _count;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);

    _begin = Offset.zero;
    _end = Offset.zero;
    _itemCouterOffset = Offset.zero;
    _visibleAnimate = 0.0;
    _count = 0;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _visibleAnimate = 0.0;
            _controller.reset();
          });
        }
      });

    _offsetAnimation = _generateAnimationPosition();
    chSystem.move = _handleAnimation;
    chSystem.count = _handleCouter;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onBuildCompleted(_) {
    _getPositions();
  }

  Widget _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return ProductCategory();
      case 2:
        return Search();
      case 3:
        return ShoppingCart();
      case 4:
        return Profile();
      default:
        return HomePage();
    }
  }

  @override
  build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _navigateToScreen(index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              setState(() {
                this.index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: new Image.asset(
                  'icons/today-icon.png',
                  height: 22,
                  width: 22,
                  color: index == 0 ? appColor.main : appColor.unfocused,
                ),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  'icons/toggle-menu-icon.png',
                  height: 22,
                  width: 22,
                  color: index == 1 ? appColor.main : appColor.unfocused,
                ),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  'icons/search-icon.png',
                  height: 22,
                  width: 22,
                  color: index == 2 ? appColor.main : appColor.unfocused,
                ),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  key: _keyShoppingCart,
                  color: index == 3 ? appColor.main : appColor.unfocused,
                ),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: index == 4 ? appColor.main : appColor.unfocused,
                ),
                title: SizedBox.shrink(),
              ),
            ],
          ),
        ),
        SlideTransition(
          position: _offsetAnimation,
          child: Opacity(
            opacity: _visibleAnimate,
            child: Container(
                width: 10.0, height: 10.0, color: appColor.redAccent100),
          ),
        ),
        // Positioned(
        //   top: _itemCouterOffset.dy,
        //   left: _itemCouterOffset.dx,
        //   child: Container(
        //     width: 20.0,
        //     height: 20.0,
        //     child: Text(
        //       "$_count",
        //       style: TextStyle(
        //         color: Colors.red,
        //         fontSize: 15.0,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  _getPositions() {
    final RenderBox renderBoxRed =
        _keyShoppingCart.currentContext.findRenderObject();
    final positionShoppingCart = renderBoxRed.localToGlobal(Offset(0, 0));

    chSystem.shoppingCartOffset = positionShoppingCart;
    setState(() {
      _itemCouterOffset = positionShoppingCart;
    });
  }

  Animation _generateAnimationPosition() {
    return Tween(
      begin: _begin,
      end: _end,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  _handleAnimation(AnimationOffset state) {
    setState(() {
      _visibleAnimate = 1.0;
      _begin = Offset(state.begin.dx / 10, state.begin.dy / 10);
      _end = Offset(chSystem.shoppingCartOffset.dx / 10,
          chSystem.shoppingCartOffset.dy / 10);
      _offsetAnimation = _generateAnimationPosition();
      _controller.forward();
    });
  }

  _handleCouter() {
    setState(() {
      ++_count;
    });
  }
}
